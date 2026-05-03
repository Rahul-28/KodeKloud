┌──────────────────────────────────────────────────────────────────┐
│                      KUBERNETES CLUSTER                          │
│                                                                  │
│  SECRETS                                                         │
│  ┌─────────────────┐  ┌──────────────────┐  ┌───────────────┐    │
│  │ mysql-root-pass │  │ mysql-user-pass  │  │ mysql-db-url  │    │
│  │ password:       │  │ username:        │  │ database:     │    │
│  │ YUIidhb667      │  │ kodekloud_cap    │  │ kodekloud_db5 │    │
│  └────────┬────────┘  │ password:        │  └──────┬────────┘    │
│           │           │ TmPcZjtRQx       │         │             │
│           │           └────────┬─────────┘         │             │
│           │                    │                   │             │
│           └────────────────────┼───────────────────┘             │
│                                │ injected as env vars            │
│                                ↓                                 │
│  ┌─────────────────────────────────────────────────────────┐     │
│  │                    POD                                  │     │
│  │  mysql-container                                        │     │
│  │  ─────────────                                          │     │
│  │  MYSQL_ROOT_PASSWORD = YUIidhb667                       │     │
│  │  MYSQL_DATABASE      = kodekloud_db5                    │     │
│  │  MYSQL_USER          = kodekloud_cap                    │     │
│  │  MYSQL_PASSWORD      = TmPcZjtRQx                       │     │
│  │                                                         │     │
│  │  MySQL reads env vars on startup                        │     │
│  │  creates database and users automatically               │     │
│  │                                                         │     │
│  │  /var/lib/mysql ← volumeMount                           │     │
│  └──────────────┬──────────────────────────────────────────┘     │
│                 │                                                │
│                 ↓                                                │
│  STORAGE                                                         │
│  mysql-pv-claim (PVC) → mysql-pv (PV) → /mnt/data on host        │
│  250Mi reserved           250Mi available   data lives here      │
│                                                                  │
│  SERVICE                                                         │
│  mysql (NodePort)                                                │
│  selector: app=db → finds the pod                                │
│  nodePort: 30007  → external access                              │
└──────────────────────────────────────────────────────────────────┘
         ↑
External connection on port 30007