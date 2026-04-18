#actual command used
find /home/usersdata/ -user anita -type f -exec cp --parents {} /media \;

#created a script 

#!/bin/bash

owner_name="anita"
source="/home/usersdata/"
dest="/media/"

find "$source" -user "$owner_name" -type f -exec cp --parents {} "$dest" \;