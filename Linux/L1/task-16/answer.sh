ssh clint@stbkp01

firewall-cmd --permanent --add-port=3000/tcp --zone=public
# output => success

firewall-cmd --reload
# output => success

firewall-cmd --list-ports --zone=public
# output => 3000/tcp