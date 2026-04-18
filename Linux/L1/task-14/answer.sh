ssh tony@stapp01
sudo su -
systemctl set-default graphical.target
systemctl status graphical.target
systemctl get-default

ssh steve@stapp02
sudo -i
systemctl set-default graphical.target
systemctl status graphical.target
systemctl get-default

ssh banner@stapp03
sudo -i
systemctl set-default graphical.target
systemctl status graphical.target
systemctl get-default