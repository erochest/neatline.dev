
class omeka::service {

  service { 'php5-fpm':
    ensure  => running,
    enable  => true,
    require => Class['omeka::install'],
  }

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

