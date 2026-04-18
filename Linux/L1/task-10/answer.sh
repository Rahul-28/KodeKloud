ssh tony@stapp01

cd /etc/

ls -ltr hostname

getfacl hostname 
# output:
# # file: hostname
# # owner: root
# # group: root
# user::rw-
# user:siva:---
# group::r--
# mask::r--
# other::r--

sudo setfacl -m u:yousuf:--- hosts

getfacl hosts 
# output:
# # file: hosts
# # owner: root
# # group: root
# user::rw-
# user:yousuf:---
# group::r--
# mask::r--
# other::r--

sudo setfacl -m u:eric:r-- hosts 

getfacl hosts 
# output:
# # file: hosts
# # owner: root
# # group: root
# user::rw-
# user:yousuf:---
# user:garrett:r--
# group::r--
# mask::r--
# other::r--