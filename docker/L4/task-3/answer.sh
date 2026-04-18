ssh steve@stapp02

sudo -i

cd /opt/sysops

vi docker-compose.yml

cat docker-compose.yml
# output:

# services:
#   web:
#     container_name: php_web
#     image: php:8.5.4RC1-apache-trixie
#     ports:
#       - "6100:80"
#     volumes:
#       - /var/www/html:/var/www/html

#   db:
#     container_name: mysql_web
#     image: mariadb:latest
#     ports: 
#       - "3306:3306"
#     volumes:
#       - /var/lib/mysql:/var/lib/mysql
#     environment:
#       MYSQL_DATABASE: database_web
#       MARIADB_ROOT_PASSWORD: complex_pass@124
#       MARIADB_USER: tony

docker compose up
# output:
# [+] up 27/27
#  ✔ Image php:8.5.4RC1-apache-trixie Pulled                                  13.3s
#  ✔ Image mariadb:latest             Pulled                                  10.4s
#  ✔ Network sysops_default           Created                                 0.1s
#  ✔ Container php_web                Created                                 0.2s
#  ✔ Container mysql_web              Created                                 0.2s
# Attaching to mysql_web, php_web
# mysql_web  | 2026-03-11 03:28:36+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:12.2.2+maria~ubu2404 started.
# php_web    | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
# php_web    | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
# php_web    | [Wed Mar 11 03:28:37.043344 2026] [mpm_prefork:notice] [pid 1:tid 1] AH00163: Apache/2.4.66 (Debian) PHP/8.5.4RC1 configured -- resuming normal operations
# php_web    | [Wed Mar 11 03:28:37.043370 2026] [core:notice] [pid 1:tid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
# mysql_web  | 2026-03-11 03:28:37+00:00 [Warn] [Entrypoint]: /sys/fs/cgroup///memory.pressure not writable, functionality unavailable to MariaDB
# mysql_web  | 2026-03-11 03:28:37+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
# mysql_web  | 2026-03-11 03:28:37+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:12.2.2+maria~ubu2404 started.
# mysql_web  | 2026-03-11 03:28:37+00:00 [Note] [Entrypoint]: Initializing database files
# mysql_web  | 2026-03-11  3:28:37 0 [Warning] mariadbd: io_uring_queue_init() failed with EPERM: sysctl kernel.io_uring_disabled has the value 2, or 1 and the user of the process is not a member of sysctl kernel.io_uring_group. (see man 2 io_uring_setup).
# mysql_web  | create_uring failed: falling back to libaio
# mysql_web  | 2026-03-11 03:28:38+00:00 [Note] [Entrypoint]: Database files initialized
# mysql_web  | 2026-03-11 03:28:38+00:00 [Note] [Entrypoint]: Starting temporary server
# mysql_web  | 2026-03-11 03:28:38+00:00 [Note] [Entrypoint]: Waiting for server startup
# mysql_web  | 2026-03-11  3:28:38 0 [Note] Starting MariaDB 12.2.2-MariaDB-ubu2404 source revision d26a6f44c1f2119377e79a9540886c6d8c01472f server_uid Tnq7keT8GKDxmAtaGW699QQYKjk= as process 201
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Compressed tables use zlib 1.3
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Number of transaction pools: 1
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Using AVX512 instructions
# mysql_web  | 2026-03-11  3:28:38 0 [Note] mariadbd: O_TMPFILE is not supported on /tmp (disabling future attempts)
# mysql_web  | 2026-03-11  3:28:38 0 [Warning] mariadbd: io_uring_queue_init() failed with EPERM: sysctl kernel.io_uring_disabled has the value 2, or 1 and the user of the process is not a member of sysctl kernel.io_uring_group. (see man 2 io_uring_setup).
# mysql_web  | create_uring failed: falling back to libaio
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Using Linux native AIO
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: innodb_buffer_pool_size_max=128m, innodb_buffer_pool_size=128m
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Completed initialization of buffer pool
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Buffered log writes (block size=512 bytes)
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: End of log at LSN=45141
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Opened 3 undo tablespaces
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: 128 rollback segments in 3 undo tablespaces are active.
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: Setting file './ibtmp1' size to 12.000MiB. Physically writing the file full; Please wait ...
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: File './ibtmp1' size is now 12.000MiB.
# mysql_web  | 2026-03-11  3:28:38 0 [Note] InnoDB: log sequence number 45141; transaction id 14
# mysql_web  | 2026-03-11  3:28:38 0 [Note] Plugin 'FEEDBACK' is disabled.
# mysql_web  | 2026-03-11  3:28:38 0 [Note] Plugin 'wsrep-provider' is disabled.
# mysql_web  | 2026-03-11  3:28:38 0 [Note] mariadbd: Event Scheduler: Loaded 0 events
# mysql_web  | 2026-03-11  3:28:38 0 [Note] Replication not automatically started: --skip-slave-start was specified
# mysql_web  | 2026-03-11  3:28:38 0 [Note] mariadbd: ready for connections.
# mysql_web  | Version: '12.2.2-MariaDB-ubu2404'  socket: '/run/mysqld/mysqld.sock'  port: 0  mariadb.org binary distribution
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: Temporary server started.
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: Creating database database_web
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: Securing system users (equivalent to running mysql_secure_installation)
# mysql_web  | 
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: Stopping temporary server
# mysql_web  | 2026-03-11  3:28:39 0 [Note] mariadbd (initiated by: unknown): Normal shutdown
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: FTS optimize thread exiting.
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Starting shutdown...
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Dumping buffer pool(s) to /var/lib/mysql/ib_buffer_pool
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Buffer pool(s) dump completed at 260311  3:28:39
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Removed temporary tablespace data file: "./ibtmp1"
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Shutdown completed; log sequence number 45498; transaction id 15
# mysql_web  | 2026-03-11  3:28:39 0 [Note] mariadbd: Shutdown complete
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: Temporary server stopped
# mysql_web  | 
# mysql_web  | 2026-03-11 03:28:39+00:00 [Note] [Entrypoint]: MariaDB init process done. Ready for start up.
# mysql_web  | 
# mysql_web  | 2026-03-11  3:28:39 0 [Note] Starting MariaDB 12.2.2-MariaDB-ubu2404 source revision d26a6f44c1f2119377e79a9540886c6d8c01472f server_uid Tnq7keT8GKDxmAtaGW699QQYKjk= as process 1
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Compressed tables use zlib 1.3
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Number of transaction pools: 1
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Using AVX512 instructions
# mysql_web  | 2026-03-11  3:28:39 0 [Note] mariadbd: O_TMPFILE is not supported on /tmp (disabling future attempts)
# mysql_web  | 2026-03-11  3:28:39 0 [Warning] mariadbd: io_uring_queue_init() failed with EPERM: sysctl kernel.io_uring_disabled has the value 2, or 1 and the user of the process is not a member of sysctl kernel.io_uring_group. (see man 2 io_uring_setup).
# mysql_web  | create_uring failed: falling back to libaio
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Using Linux native AIO
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: innodb_buffer_pool_size_max=128m, innodb_buffer_pool_size=128m
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Completed initialization of buffer pool
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Buffered log writes (block size=512 bytes)
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: End of log at LSN=45498
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Opened 3 undo tablespaces
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: 128 rollback segments in 3 undo tablespaces are active.
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Setting file './ibtmp1' size to 12.000MiB. Physically writing the file full; Please wait ...
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: File './ibtmp1' size is now 12.000MiB.
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: log sequence number 45498; transaction id 15
# mysql_web  | 2026-03-11  3:28:39 0 [Note] Plugin 'FEEDBACK' is disabled.
# mysql_web  | 2026-03-11  3:28:39 0 [Note] Plugin 'wsrep-provider' is disabled.
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
# mysql_web  | 2026-03-11  3:28:39 0 [Note] InnoDB: Buffer pool(s) load completed at 260311  3:28:39
# mysql_web  | 2026-03-11  3:28:41 0 [Note] Server socket created on IP: '0.0.0.0', port: '3306'.
# mysql_web  | 2026-03-11  3:28:41 0 [Note] Server socket created on IP: '::', port: '3306'.
# mysql_web  | 2026-03-11  3:28:41 0 [Note] mariadbd: Event Scheduler: Loaded 0 events
# mysql_web  | 2026-03-11  3:28:41 0 [Note] mariadbd: ready for connections.
# mysql_web  | Version: '12.2.2-MariaDB-ubu2404'  socket: '/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution


# w Enable Watch   d Detach

docker compose ls
# output:
# NAME                STATUS              CONFIG FILES
# sysops              running(2)          /opt/sysops/docker-compose.yml

curl stapp02:6100
# output:
# <html>
#     <head>
#         <title>Welcome to xFusionCorp Industries!</title>
#     </head>

#     <body>
#         Welcome to xFusionCorp Industries!    </body>
# </html>