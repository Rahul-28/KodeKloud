kubectl run print-envars-greeting --image=bash:latest -o yaml > pod-def.yaml

cat pod-def.yaml
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   creationTimestamp: "2026-04-02T16:19:28Z"
#   generation: 1
#   labels:
#     run: print-envars-greeting
#   name: print-envars-greeting
#   namespace: default
#   resourceVersion: "1049"
#   uid: 3eb02f64-4610-45b4-a1bc-c2ef8f3193fb
# spec:
#   containers:
#   - image: bash:latest
#     imagePullPolicy: Always
#     name: print-env-container
#     resources: {}
#     env:
#     - name: GREETING
#       value: "Welcome to"
#     - name: COMPANY
#       value: "Stratos"
#     - name: GROUP
#       value: "Industries"
#     command: [ "bin/sh", "-c" ]
#     args:
#     - 'echo "$(GREETING) $(COMPANY) $(GROUP)"'
#     terminationMessagePath: /dev/termination-log
#     terminationMessagePolicy: File
#     volumeMounts:
#     - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
#       name: kube-api-access-2db5n
#       readOnly: true
#   dnsPolicy: ClusterFirst
#   enableServiceLinks: true
#   preemptionPolicy: PreemptLowerPriority
#   priority: 0
#   restartPolicy: Never
#   schedulerName: default-scheduler
#   securityContext: {}
#   serviceAccount: default
#   serviceAccountName: default
#   terminationGracePeriodSeconds: 30
#   tolerations:
#   - effect: NoExecute
#     key: node.kubernetes.io/not-ready
#     operator: Exists
#     tolerationSeconds: 300
#   - effect: NoExecute
#     key: node.kubernetes.io/unreachable
#     operator: Exists
#     tolerationSeconds: 300
#   volumes:
#   - name: kube-api-access-2db5n
#     projected:
#       defaultMode: 420
#       sources:
#       - serviceAccountToken:
#           expirationSeconds: 3607
#           path: token
#       - configMap:
#           items:
#           - key: ca.crt
#             path: ca.crt
#           name: kube-root-ca.crt
#       - downwardAPI:
#           items:
#           - fieldRef:
#               apiVersion: v1
#               fieldPath: metadata.namespace
#             path: namespace
# status:
#   phase: Pending
#   qosClass: BestEffort

kubectl get all
# output:
# NAME                        READY   STATUS             RESTARTS       AGE
# pod/print-envars-greeting   0/1     CrashLoopBackOff   6 (112s ago)   7m36s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   26m

kubectl delete pod print-envars-greeting 
# output:
# pod "print-envars-greeting" deleted from default namespace

kubectl create -f pod-def.yaml 
# output:
# pod/print-envars-greeting created

kubectl get pod
# output:
# NAME                    READY   STATUS      RESTARTS   AGE
# print-envars-greeting   0/1     Completed   0          25s

kubectl logs -f print-envars-greeting
# output:
# Welcome to Stratos Industries