## {{{ Execs

exec { 'apt-get update':
  path => ['/usr/bin'],
}

#}}}

## {{{ Packages

package { 'nginx':
  ensure  => installed,
  require => Exec['apt-get update'],
}

package { 'mysql-server':
  ensure  => installed,
  require => Exec['apt-get update'],
}

package { 'imagemagick':
  ensure  => installed,
  require => Exec['apt-get update'],
}

package { 'git':
  ensure => installed,
  require => Exec['apt-get update'],
}

# }}}

## {{{ Services

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

service { 'mysql':
  ensure  => running,
  enable  => true,
  require => Package['mysql-server'],
}

# }}}

## {{{ Omeka

exec { 'omeka':
  cwd     => '/vagrant',
  command => 'git clone --branch stable-1.5 git://github.com/omeka/Omeka.git && git submodule init && git submodule update',
  path    => ['/usr/bin/'],
  require => Package['git'],
  creates => '/vagrant/Omeka',
}

exec { 'neatline-time':
  cwd     => '/vagrant/Omeka/plugins',
  command => 'git clone git://github.com/scholarslab/NeatlineTime.git',
  path    => ['/usr/bin/'],
  require => [Exec['omeka'], Package['git']],
  creates => '/vagrant/Omeka/plugins/NeatlineTime',
}

# }}}

# vim :set foldmethod=marker:
