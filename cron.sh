cd /root/myopds-pi-config
git pull origin master
puppet apply --modulepath=/root/myopds-pi-config/modules/  /root/myopds-pi-config/init.pp
cd /root/rails-opds-server/
