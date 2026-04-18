useradd jim -u 1765 -d /var/www/jim

# proof that jim was created
#  cat /etc/passwd | grep jim
# output=> jim:x:1765:1765::/var/www/jim:/bin/bash