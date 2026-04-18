sudo su -

sudo yum install cronie -y

sudo systemctl start crond

sudo systemctl restart crond

crontab -e

# add the following line 
# */5 * * * * echo hello > /tmp/cron_text

# on closing you get the message "crontab: installing new crontab" 
# which means the cron job is added successfully.

# output
# no crontab for root - using an empty one 
# crontab: installing new crontab

# after 5 minutes
cat /tmp/cron_text
# output => hello