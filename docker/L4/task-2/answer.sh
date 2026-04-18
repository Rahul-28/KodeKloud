ssh banner@stapp03

cd /opt/docker/

vi docker-compose.yml

# after fixing errors:

cat docker-compose.yml
# output:
# name: myapp

# services:
#     web:
#         build: ./app
#         container_name: python
#         ports:
#             - "5000:5000"
#         volumes:
#             - ./app:/code
#         depends_on:
#             - redis
#     redis:
#         image: redis
#         container_name: redis

docker compose up
# output:
# [+] up 7/8
#  ⠼ Image redis [⣿⣿⣿⣿⣿⣿⣿] 53.23MB / 53.23MB Pulling                           3.5s
# [+] Building 12.7s (11/11) FINISHED                                              
#  => [internal] load local bake definitions                                  0.0s
#  => => reading from stdin 466B                                              0.0s
#  => [internal] load build definition from Dockerfile                        0.1s
#  => => transferring dockerfile: 151B                                        0.0s
#  => [internal] load metadata for docker.io/library/python:3.13.0b1-slim-bu  1.6s
#  => [internal] load .dockerignore                                           0.1s
#  => => transferring context: 2B                                             0.0s
#  => [internal] load build context                                           0.1s
#  => => transferring context: 583B                                           0.0s
#  => [1/4] FROM docker.io/library/python:3.13.0b1-slim-bullseye@sha256:6efc  5.0s
#  => => resolve docker.io/library/python:3.13.0b1-slim-bullseye@sha256:6efc  0.1s
#  => => sha256:6efce108697ffabf20924c157d5f08bc41550aca27a0 1.65kB / 1.65kB  0.0s
#  => => sha256:a0b77fc2fe6f772e9b87158cfcec99e348da5147d028 1.37kB / 1.37kB  0.0s
#  => => sha256:55c499a8da5e2f836f213ca0fd84050669f010b0fdc9 6.56kB / 6.56kB  0.0s
#  => => sha256:728328ac3bde9b85225b1f0d60f5c149f5635a191f 31.43MB / 31.43MB  1.0s
#  => => sha256:1db7ac90e91be4e66b79a2b989769b759afa5435b16e 1.08MB / 1.08MB  0.6s
#  => => sha256:fa67c4e1e796c98ca666481efb84f36cdfa8a69999 10.87MB / 10.87MB  1.1s
#  => => sha256:67b38c82ef531feccf9a0875b321a4285f28bf90e68ed0d0 241B / 241B  0.9s
#  => => sha256:90ed103683eb337f616d58cc7af0fdab95831c6f39b6 3.06MB / 3.06MB  1.2s
#  => => extracting sha256:728328ac3bde9b85225b1f0d60f5c149f5635a191f5d8eaee  1.1s
#  => => extracting sha256:1db7ac90e91be4e66b79a2b989769b759afa5435b16e00cff  0.3s
#  => => extracting sha256:fa67c4e1e796c98ca666481efb84f36cdfa8a69999415a66f  0.7s
#  => => extracting sha256:67b38c82ef531feccf9a0875b321a4285f28bf90e68ed0d09  0.1s
#  => => extracting sha256:90ed103683eb337f616d58cc7af0fdab95831c6f39b66ba38  0.5s
#  => [2/4] ADD . /code                                                       0.1s
#  => [3/4] WORKDIR /code                                                     0.1s
#  => [4/4] RUN pip install -r requirements.txt                               4.0s
#  => exporting to image                                                      1.2s 
#  => => exporting layers                                                     1.1s
#  => => writing image sha256:ea6ffb23b483dec9ec1e3cdab7dd14376bb9e10aa2d72a  0.0s
# [+] up 12/12g to docker.io/library/myapp-web                                0.0s
#  ✔ Image redis           Pulled                                             3.5s
#  ✔ Image myapp-web       Built                                              12.7s
#  ✔ Network myapp_default Created                                            0.1s
#  ✔ Container redis       Created                                            0.1s
#  ✔ Container python      Created                                            0.1s
# Attaching to python, redis
# redis  | Starting Redis Server
# redis  | 1:C 10 Mar 2026 14:14:35.089 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
# redis  | 1:C 10 Mar 2026 14:14:35.089 * Redis version=8.6.1, bits=64, commit=00000000, modified=1, pid=1, just started
# redis  | 1:C 10 Mar 2026 14:14:35.089 * Configuration loaded
# redis  | 1:M 10 Mar 2026 14:14:35.089 * monotonic clock: POSIX clock_gettime
# redis  | 1:M 10 Mar 2026 14:14:35.090 * Running mode=standalone, port=6379.
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf> RedisBloom version 8.6.0 (Git=unknown)
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf> Registering configuration options: [
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { bf-error-rate       :      0.01 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { bf-initial-size     :       100 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { bf-expansion-factor :         2 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { cf-bucket-size      :         2 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { cf-initial-size     :      1024 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { cf-max-iterations   :        20 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { cf-expansion-factor :         1 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf>    { cf-max-expansions   :        32 }
# redis  | 1:M 10 Mar 2026 14:14:35.090 * <bf> ]
# redis  | 1:M 10 Mar 2026 14:14:35.090 * Module 'bf' loaded from /usr/local/lib/redis/modules//redisbloom.so
# redis  | 1:M 10 Mar 2026 14:14:35.092 * <search> Redis version found by RedisSearch : 8.6.1 - oss
# redis  | 1:M 10 Mar 2026 14:14:35.092 * <search> RediSearch version 8.6.0 (Git=7782b97)
# redis  | 1:M 10 Mar 2026 14:14:35.092 * <search> Low level api version 1 initialized successfully
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> gc: ON, prefix min length: 2, min word length to stem: 4, prefix max expansions: 200, query timeout (ms): 500, timeout policy: return, oom policy: return, cursor read size: 1000, cursor max idle (ms): 300000, max doctable size: 1000000, max number of search results:  1000000, default scorer: BM25STD, 
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Initialized thread pools!
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Disabled workers threadpool of size 0
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Subscribe to config changes
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Subscribe to cluster slot migration events
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Enabled role change notification
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <search> Cluster configuration: AUTO partitions, type: 0, coordinator timeout: 0ms
# redis  | 1:M 10 Mar 2026 14:14:35.093 * Module 'search' loaded from /usr/local/lib/redis/modules//redisearch.so
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries> RedisTimeSeries version 80600, git_sha=05fd355db748676861dc4c17d19c8c1ca74c0154
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries> Redis version found by RedisTimeSeries : 8.6.1 - oss
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries> Registering configuration options: [
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-compaction-policy   :              }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-num-threads         :            3 }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-retention-policy    :            0 }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-duplicate-policy    :        block }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-chunk-size-bytes    :         4096 }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-encoding            :   compressed }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-ignore-max-time-diff:            0 }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries>    { ts-ignore-max-val-diff :     0.000000 }
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries> ]
# redis  | 1:M 10 Mar 2026 14:14:35.093 * <timeseries> Detected redis oss
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <timeseries> Subscribe to ASM events
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <timeseries> Enabled diskless replication
# redis  | 1:M 10 Mar 2026 14:14:35.094 * Module 'timeseries' loaded from /usr/local/lib/redis/modules//redistimeseries.so
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Created new data type 'ReJSON-RL'
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> version: 80600 git sha: unknown branch: unknown
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V1 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V2 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V3 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V4 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V5 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Exported RedisJSON_V6 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Enabled diskless replication
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <ReJSON> Initialized shared string cache, thread safe: true.
# redis  | 1:M 10 Mar 2026 14:14:35.094 * Module 'ReJSON' loaded from /usr/local/lib/redis/modules//rejson.so
# redis  | 1:M 10 Mar 2026 14:14:35.094 * <search> Acquired RedisJSON_V6 API
# redis  | 1:M 10 Mar 2026 14:14:35.094 * Server initialized
# redis  | 1:M 10 Mar 2026 14:14:35.094 * Ready to accept connections tcp
# redis  | 1:M 10 Mar 2026 14:14:35.094 # WARNING: Redis does not require authentication and is not protected by network restrictions. Redis will accept connections from any IP address on any network interface.
# python  |  * Serving Flask app 'app'
# python  |  * Debug mode: on
# python  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
# python  |  * Running on all addresses (0.0.0.0)
# python  |  * Running on http://127.0.0.1:5000
# python  |  * Running on http://172.17.0.3:5000
# python  | Press CTRL+C to quit
# python  |  * Restarting with stat
# python  |  * Debugger is active!
# python  |  * Debugger PIN: 144-490-020


# w Enable Watch   d Detach
