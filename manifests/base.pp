package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enabled => true,
}
