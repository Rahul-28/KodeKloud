ssh tony@stapp01

[tony@stapp01 ~]$ docker images
# output:
# REPOSITORY   TAG          IMAGE ID       CREATED         SIZE
# ecommerce    datacenter   528ce666b069   4 minutes ago   138MB
# ubuntu       latest       bbdabce66f1b   3 weeks ago     78.1MB

[tony@stapp01 ~]$ docker save --help
# output:
# Usage:  docker save [OPTIONS] IMAGE [IMAGE...]

# Save one or more images to a tar archive (streamed to STDOUT by default)

# Aliases:
#   docker image save, docker save

# Options:
#   -o, --output string   Write to a file, instead of STDOUT

[tony@stapp01 ~]$ docker save --output ecommerce.tar ecommerce:datacenter

[tony@stapp01 ~]$ ls
# output:
# ecommerce.tar

[tony@stapp01 ~]$ scp ecommerce.tar banner@stapp03:~/

ssh banner@stapp03

[banner@stapp03 ~]$ docker load --help
# output:
# Usage:  docker load [OPTIONS]

# Load an image from a tar archive or STDIN

# Aliases:
#   docker image load, docker load

# Options:
#   -i, --input string   Read from tar archive file, instead of STDIN
#   -q, --quiet          Suppress the load output

[banner@stapp03 ~]$ docker load -i ecommerce.tar 