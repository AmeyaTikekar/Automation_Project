sudo apt update -y

sudo apt install apache2

service apache2 status

sudo systemctl enable apache2

systemctl is-active apache2

#timestp1 = $(date "+%Y-%m-%d-%H-%M-%S")
namex="ameya"

tar -czvf $namex-https-logs-$(date "+%Y-%m-%d-%H-%M-%S").tar.gz /var/log/apache2

cp ./*.tar.gz /tmp/tar/

s3_bucket="upgrad-ameya"

aws s3 sync /tmp/tar/ s3://$s3_bucket

if [ ! -e /var/www/html/inventory.html ]
then echo "Log Type" > inventorydraft.html
      echo "Time created" >> inventorydraft.html
      echo "Type" >> inventorydraft.html
      echo "Size" >> inventorydraft.html
      column inventorydraft.html > /var/www/html/inventory.html
fi     

     echo "httpd-logs" > inventorydraft.html
     echo $(date "+%Y%m%d-%H%M%S") >> inventorydraft.html
     echo "tar" >> inventorydraft.html 
     du -h /tmp/ameya* | sort -nr | tail -1 | awk '{print $1}' >> inventorydraft.html
     column inventorydraft.html >> /var/www/html/inventory.html


	 echo "0 2 * * * root /root/Automation_Project/atomation.sh" > /etc/cron.d/automation



