
class omeka::service {

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Class['omeka::install'],
  }

  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Class['omeka::install'],
  }

}

