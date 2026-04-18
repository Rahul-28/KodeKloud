
root@8f92e2bdaa7c:/# apt install apache2

sed -i 's/Listen 80/Listen 8087/' /etc/apache2/ports.conf

sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:8087>/' /etc/apache2/sites-enabled/000-default.conf

service apache2 start
service apache2 status
service apache2 restart  