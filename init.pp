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

package { 'git':
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
