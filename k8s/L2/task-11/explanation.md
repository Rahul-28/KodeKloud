## Full Explanation — Question and Solution

---

## What Was the Application?

A WordPress LAMP stack running on Kubernetes with:
```
Apache + PHP  →  httpd-php-container  (serves the website)
MySQL         →  mysql-container      (stores the data)
```

Both containers are in the **same pod** but something broke and the website went down.

---

## Step 1 — Get the Big Picture

```bash
kubectl get all
```

This shows everything running in the cluster. From the output you immediately spotted:

```
service/lamp-service   NodePort   80:30009/TCP   ❌
service/mysql-service  ClusterIP  3306/TCP       ← important clue
```

**Two things noticed:**
- NodePort is `30009` but question says it should be `30008`
- A separate `mysql-service` exists

---

## Step 2 — Understand the Pod

```bash
kubectl describe pod lamp-wp-5594699b75-9t55m
```

This showed:
- Both containers running ✅
- All environment variables coming from secrets ✅
- No crash errors in events ✅

So the pod itself was healthy. The bugs were elsewhere.

---

## Step 3 — Fix Bug 1 — Wrong NodePort

```bash
kubectl edit svc lamp-service
```

Changed:
```yaml
nodePort: 30009   # ❌ wrong
nodePort: 30008   # ✅ correct
```

**What is NodePort?** It is the door number that outside traffic uses to reach your application. Wrong door number = nobody can get in.

---

## Step 4 — Go Inside the Container and Find Bug 2

```bash
kubectl exec -it lamp-wp-5594699b75-9t55m -c httpd-php-container -- sh
```

This opens a shell **inside** the Apache container. Then:

```bash
cat /app/index.php
```

This revealed the actual PHP file that connects to the database. Look carefully at what was inside:

```php
// ❌ BROKEN version inside the container
$dbpass = $_ENV[''MYSQL_PASSWORD""];   // wrong quotes — mix of '' and ""
$dbhost = $_ENV['MYSQL-HOST'];         // hyphen instead of underscore
```

**Two syntax errors in this file:**

| Line | Bug | Problem |
|---|---|---|
| `$dbpass` | `''MYSQL_PASSWORD""` | Mixed quotes — broken PHP syntax |
| `$dbhost` | `MYSQL-HOST` | Hyphen `-` instead of underscore `_` |

Because of `MYSQL-HOST`, PHP could not read the environment variable at all. The variable name must exactly match — `MYSQL_HOST` is completely different from `MYSQL-HOST` to PHP. This is why the website showed:

```
Unable to Connect to ""    ← empty because PHP couldn't read MYSQL-HOST
```

---

## Step 5 — Fix Bug 2 — Create Corrected PHP File

You **cannot just edit the file inside the container** because:
```
Container filesystem is temporary
Pod restarts → your edit disappears forever ❌
```

So the correct approach is:

### 5a — Create the fixed file on the jump host
```bash
vi index.php
```

Write the corrected version:
```php
// ✅ FIXED version
$dbname = $_ENV['MYSQL_DATABASE'];
$dbuser = $_ENV['MYSQL_USER'];
$dbpass = $_ENV['MYSQL_PASSWORD'];    // fixed quotes
$dbhost = $_ENV['MYSQL_HOST'];        // underscore instead of hyphen
```

---

### 5b — Create a ConfigMap from the fixed file
```bash
kubectl create cm index --from-file=index.php
```

Breaking this down:
```
kubectl create cm     →  create a ConfigMap
index                 →  name of the ConfigMap
--from-file=index.php →  read the contents of index.php
                          and store it inside the ConfigMap
```

**What is a ConfigMap here?**
Think of it like a **filing cabinet** in Kubernetes that stores your file permanently. Even if the pod restarts, the filing cabinet still exists and has your correct file.

You can verify it was created correctly:
```bash
kubectl describe cm index
```
This shows the fixed PHP code is now stored safely in Kubernetes.

---

### 5c — Mount the ConfigMap into the deployment
```bash
kubectl edit deployments.apps lamp-wp
```

This opens the deployment for editing. You added two things:

**Under the `httpd-php-container` volumeMounts section:**
```yaml
volumeMounts:
- mountPath: /app/index.php    # exact path of the broken file
  name: index                  # name of our configmap volume
  subPath: index.php           # mount as a FILE not a folder
```

**Under the pod level volumes section:**
```yaml
volumes:
- name: index
  configMap:
    name: index                # matches the configmap we created
    defaultMode: 420
```

---

## Why `subPath` is Critical

```
Without subPath:
mountPath: /app/index.php
→ Kubernetes creates a FOLDER called index.php ❌
→ PHP cannot read a folder as a file

With subPath: index.php
mountPath: /app/index.php
→ Kubernetes creates a FILE called index.php ✅
→ PHP reads it correctly
```

---

## What Happened After the Edit

When you saved the deployment edit, Kubernetes automatically:
```
1. Detected the deployment changed
2. Killed the old pod
3. Created a brand new pod with the ConfigMap mounted
4. New pod has the CORRECT index.php at /app/index.php
5. Website works ✅
```

You can see this in the final describe output:
```
Mounts:
  /app/index.php from index (rw,path="index.php")   ← new mount appeared
```

---

## The Complete Flow — All Bugs and Fixes

```
BUG 1 — Wrong NodePort
────────────────────────────────────────────
Found    →  kubectl get all
             lamp-service showing 30009
Problem  →  outside traffic hitting wrong port
Fix      →  kubectl edit svc lamp-service
             30009 → 30008


BUG 2 — Broken PHP file
────────────────────────────────────────────
Found    →  kubectl exec into httpd-php-container
             cat /app/index.php
Problem  →  MYSQL-HOST (hyphen) instead of MYSQL_HOST (underscore)
             broken quotes on MYSQL_PASSWORD line
Fix      →  vi index.php on jump host (create corrected file)
             kubectl create cm index --from-file=index.php
             kubectl edit deployment lamp-wp
             mount configmap at /app/index.php with subPath


RESULT   →  "Connected successfully" ✅
```

---

## Key Commands Reference Card

```bash
# See everything running
kubectl get all

# Read all secrets list
kubectl get secrets

# See pod details and environment variables
kubectl describe pod <pod-name>

# See service details
kubectl describe svc <service-name>

# See configmap contents
kubectl describe cm <configmap-name>

# Edit a service live
kubectl edit svc <service-name>

# Go inside a specific container
kubectl exec -it <pod-name> -c <container-name> -- sh

# Read a file inside the container
cat /path/to/file

# Create configmap from a local file
kubectl create cm <name> --from-file=<filename>

# Edit a deployment live
kubectl edit deployments.apps <deployment-name>
```

---

## The Most Important Lesson

> **Always go inside the container and read the application files.** Kubernetes configuration can look perfectly fine while the actual application code has bugs. In this case, a single character — hyphen instead of underscore — brought the entire website down. No Kubernetes command would have revealed this. Only `cat /app/index.php` did.

The debugging order for this type of question:
```
1. kubectl get all          →  spot obvious misconfigurations (NodePort)
2. kubectl describe pod     →  check container health and env vars
3. kubectl exec + cat file  →  read actual application code
4. Fix at Kubernetes level  →  ConfigMap mount (never edit inside container)
```