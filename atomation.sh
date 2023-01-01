sudo apt update -y

sudo apt install apache2

service apache2 status

sudo systemctl enable apache2

systemctl is-active apache2

timestamp = $(date '+%Y-%m-%d-%H-%M-%S')

tar -czvf ameya-https-logs-$(timestamp).tar.gz /var/log/apache2

cp ./*.tar.gz /tmp




echo "https-log" > inventorydraft.html
echo $(date "+%Y%m%d-%H%M%S") >> inventorydraft.html
echo "tar" >> inventorydraft.html
du -h ameya-https-logs-$(timestamp).tar.gz | awk '{print $1}' >> inventorydraft.html

column inventorydraft.html >> /var/www/html/inventory.html



sudo su >> /etc/cron.d/automation
0 2 * * * /root/Automation_Project/atomation >> /etc/cron.d/automation.sh 
