sudo apt update -y

sudo apt install apache2

service apache2 status

sudo systemctl enable apache2

systemctl is-active apache2

timestamp = $(date '+%Y-%m-%d-%H-%M-%S')

tar -czvf ameya-https-logs-$(timestamp).tar.gz /var/log/apache2

cp ./*.tar.gz /tmp


