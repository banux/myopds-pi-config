
Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

class{git:
      svn => false,
      gui => false,
    }

package { 'bundler':
  ensure => installed,
  provider => 'gem'
}

package { 'sqlite3':
  ensure => installed
}

package { 'libxml2':
  ensure => installed
}

package { 'libxslt':
  ensure => installed
}

package { 'zip':
  ensure => installed
}

package { 'unzip':
  ensure => installed
}

package { 'gcc':
  ensure => installed
}

package { 'make':
  ensure => installed
}

package { 'imagemagick':
  ensure => installed
}

git::repo{'rails-opds-server':
	path   => '/root/rails-opds-server/',
	source => 'git://github.com/banux/rails-opds-server.git',
	branch => 'raspberry',
	update => true
}

exec { "bundle install":
	command => "cd /root/rails-opds-server ; bundle install --without assets test development",
	require => Package[bundler]
}

exec { "migrate":
	command => "cd /root/rails-opds-server ; bundle exec rake db:migrate RAILS_ENV=production",
	require => Package[bundler]
}

exec { "start puma if state missing":
    command => "cd /root/rails-opds-server ; bundle exec rails s -e production -p 80 -d puma",
    creates => "/tmp/puma-state"
}

exec { "restart puma":
    command => "cd /root/rails-opds-server ; bundle exec pumactl -S /tmp/puma-state restart",
}

