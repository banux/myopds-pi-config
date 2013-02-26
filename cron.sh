cd /root/myopds-pi-config
git pull origin master
puppet apply --modulepath=/root/myopds-pi-config/modules/  /root/myopds-pi-config/init.pp
cd /root/rails-opds-server/
bundle install --without assets test development
bundle exec rake db:migrate RAILS_ENV=production
bundle exec pumactl -S /tmp/puma-state restart

