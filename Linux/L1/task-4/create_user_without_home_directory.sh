sudo useradd -M ravi

# The command above creates a new user
# flag -M creates a new user without a home directory

#also understood the commands useradd and adduser are used to create users in linux

# proof that user ravi was created with non-interactive shell
# cat /etc/passwd | grep ravi
# output => ravi:x:1002:1002::/home/ravi:/bin/bash