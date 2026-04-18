## Understanding Persistent Volumes — The Full Picture

---

## The Problem That PV and PVC Solve

First understand **why** these exist.

Containers are by nature **temporary**:
```
Pod dies → everything inside it disappears forever
Pod restarts → starts completely fresh, all data gone
```

This is a huge problem for applications like:
```
WordPress  →  uploaded images gone on restart ❌
MySQL      →  entire database gone on restart ❌
Web server →  all website files gone on restart ❌
```

Kubernetes solved this with **Persistent Volumes** — storage that lives **independently** of pods. Even if the pod dies, the data survives.

---

## The Real World Analogy

Think of it like **renting office space** in a building:

```
Building owner    =  Kubernetes Administrator
Office space      =  PersistentVolume (PV)
Rental agreement  =  PersistentVolumeClaim (PVC)
Company (tenant)  =  Pod
```

```
Building owner creates office spaces of different sizes
                    ↓
Company says "I need a 2000 sq ft office"
                    ↓
Building owner matches them with a 3000 sq ft office
                    ↓
Company signs rental agreement and moves in
                    ↓
Even if employees (containers) leave and come back
the office (storage) and everything in it remains
```

---

## What is a PersistentVolume (PV)?

A PV is a **piece of storage** that the administrator creates in the cluster. It exists independently — it is not attached to any pod or application.

Think of it as the **physical storage space** being made available.

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-devops          # name of this storage space
spec:
  storageClassName: manual  # category/type of storage
  capacity:
    storage: 3Gi            # total size available: 3 Gigabytes
  accessModes:
    - ReadWriteOnce         # who can use it and how
  hostPath:
    path: "/mnt/data"       # where on the actual machine the data lives
```

### Breaking down each field:

**`storageClassName: manual`**
```
Think of this like a CATEGORY TAG on the storage
manual = this storage needs to be manually managed by admin
Other examples: ssd, standard, premium

PVC must request the same storageClassName to match with this PV
```

**`capacity: storage: 3Gi`**
```
This PV has 3 Gigabytes of total space available
Like saying "this office is 3000 sq ft"
```

**`accessModes: ReadWriteOnce`**
```
ReadWriteOnce   →  only ONE node can mount this for reading AND writing
                   (most common for databases, web servers)
ReadOnlyMany    →  MANY nodes can mount this but only for reading
ReadWriteMany   →  MANY nodes can mount this for reading AND writing
```

**`hostPath: path: "/mnt/data"`**
```
hostPath = use a directory on the actual host machine (node) as storage
path: /mnt/data = the actual folder on the machine where data is stored

Other volume types in real production:
→ NFS (network file system)
→ AWS EBS (Elastic Block Store)
→ Google Persistent Disk
→ Azure Disk

hostPath is used for learning/testing since we only have one node
```

---

## What is a PersistentVolumeClaim (PVC)?

A PVC is a **request for storage** made by a pod/application. It says "I need storage with these requirements — give me a matching PV."

Think of it as the **rental agreement** — the application saying what it needs.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-devops           # name of this storage request
spec:
  storageClassName: manual   # must match PV's storageClassName
  accessModes:
    - ReadWriteOnce          # must match PV's accessModes
  resources:
    requests:
      storage: 2Gi           # I need at least 2 Gigabytes
```

### Breaking down each field:

**`storageClassName: manual`**
```
Must match the PV's storageClassName
Kubernetes uses this to filter which PVs are eligible
```

**`accessModes: ReadWriteOnce`**
```
Must match what the PV offers
Kubernetes checks this during matching
```

**`resources.requests.storage: 2Gi`**
```
The application needs at least 2 Gigabytes
Kubernetes finds a PV that has >= 2Gi available
Our PV has 3Gi → 3Gi >= 2Gi → eligible match ✅
```

---

## How PV and PVC Work Together — The Binding Process

```
STEP 1: Admin creates PV
─────────────────────────
pv-devops created
├── storageClassName: manual
├── capacity: 3Gi
├── accessMode: ReadWriteOnce
└── hostPath: /mnt/data
STATUS: Available ← waiting for a claim


STEP 2: Developer creates PVC
──────────────────────────────
pvc-devops created
├── storageClassName: manual  ← matches pv-devops ✅
├── accessMode: ReadWriteOnce ← matches pv-devops ✅
└── requests: 2Gi             ← 3Gi >= 2Gi ✅
STATUS: Pending ← looking for a matching PV


STEP 3: Kubernetes matches them automatically
──────────────────────────────────────────────
Kubernetes sees:
"pvc-devops needs manual storage, ReadWriteOnce, at least 2Gi"
"pv-devops offers manual storage, ReadWriteOnce, 3Gi"
"All conditions match → BIND them together"

pv-devops  STATUS: Bound ← claimed by pvc-devops
pvc-devops STATUS: Bound ← matched with pv-devops


STEP 4: Pod uses the PVC
─────────────────────────
Pod references pvc-devops
Gets access to the storage on /mnt/data
Mounts it at /usr/local/apache2/htdocs inside the container
```

---

## How the Pod Uses the PVC

```yaml
spec:
  volumes:
    - name: pv-devops                  # what to call this volume inside the pod
      persistentVolumeClaim:
        claimName: pvc-devops          # which PVC to use

  containers:
    - name: container-devops
      image: httpd:latest
      volumeMounts:
        - mountPath: "/usr/local/apache2/htdocs"  # where inside container
          name: pv-devops                          # matches volumes.name above
```

The connection chain:
```
Pod's volumes section
        ↓
references pvc-devops (the PVC)
        ↓
PVC is bound to pv-devops (the PV)
        ↓
PV points to /mnt/data on the host machine
        ↓
Container sees /mnt/data content at /usr/local/apache2/htdocs
```

---

## The Service — The Front Door

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-devops
spec:
  type: NodePort
  selector:
    app: httpd          # find pods with this label
  ports:
    - port: 80          # service listens here
      targetPort: 80    # forwards to container port 80
      nodePort: 30008   # external access port
```

```
Browser → nodeIP:30008 → web-devops service → pod-devops:80 → httpd container
```

---

## The Complete Picture

```
HOST MACHINE
┌────────────────────────────────────────────────────┐
│  /mnt/data  ← actual files live here               │
│      ↑                                             │
│      │ hostPath                                    │
│      │                                             │
│  PersistentVolume (pv-devops)                      │
│  3Gi, manual, ReadWriteOnce                        │
│      ↑                                             │
│      │ bound                                       │
│      │                                             │
│  PersistentVolumeClaim (pvc-devops)                │
│  requests 2Gi, manual, ReadWriteOnce               │
│      ↑                                             │
│      │ mounted at                                  │
│      │                                             │
│  POD (pod-devops)                                  │
│  ┌─────────────────────────────────┐               │
│  │  container-devops               │               │
│  │  image: httpd:latest            │               │
│  │  /usr/local/apache2/htdocs      │               │
│  │  (files served from here)       │               │
│  │  ↕ same as /mnt/data on host   │               │
│  └─────────────────────────────────┘               │
│      ↑                                             │
│      │                                             │
│  Service (web-devops)                              │
│  NodePort 30008 → pod port 80                      │
└────────────────────────────────────────────────────┘
        ↑
   Browser request
   nodeIP:30008
```

---

## Why This Architecture Matters

```
WITHOUT PV/PVC:
Pod deleted → /usr/local/apache2/htdocs gone → website files gone ❌

WITH PV/PVC:
Pod deleted → /mnt/data on host machine untouched → files safe ✅
New pod created → mounts same PVC → finds all files still there ✅
```

This is the entire point — **separating the storage lifecycle from the pod lifecycle**. The pod can come and go freely. The data outlives all of them.

---

## One Sentence Per Component

| Component | One sentence |
|---|---|
| PersistentVolume (PV) | Actual storage space created by admin — exists independently of any pod |
| PersistentVolumeClaim (PVC) | A request by an application for storage matching certain requirements |
| Binding | Kubernetes automatically matches PVC to a suitable PV |
| hostPath | Store data in a folder on the actual host machine |
| storageClassName | Category tag that must match between PV and PVC for binding |
| accessMode | Rules about how many nodes can read/write to the storage |
| volumeMounts | Where inside the container the storage appears |
| NodePort Service | The external door that lets browsers reach the web server |