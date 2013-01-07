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
# vim :set foldmethod=marker:
