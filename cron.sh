cd /root/myopds-pi-config
git pull origin master
puppet --modulepath=/root/myopds-pi-config/modules/ apply /root/myopds-pi-config/init.pp
cd /root/rails-opds-server/
bundle install
bundle exec rake db:migrate RAILS_ENV=production
bundle exec pumactl -S /tmp/puma-state restart

