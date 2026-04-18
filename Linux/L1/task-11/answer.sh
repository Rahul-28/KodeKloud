ssh clint@stbkp01

sudo su -

sed -i 's/Text/LUSV/g' /root/nautilus.xml 

# the i option is for in-place editing without it the changes won't be saved to the file