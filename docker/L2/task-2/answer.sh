getent group docker
# output:
# docker:x:998:steve

sudo usermod -aG docker mariyam
# args:
# 1. -G, --groups GROUPS           new list of supplementary GROUPS
# 2. -a, --append                  append the user to the supplemental GROUPS mentioned by the -G option 
#                                  without removing the user from other groups

getent group docker
# output:
# docker:x:998:steve,mariyam