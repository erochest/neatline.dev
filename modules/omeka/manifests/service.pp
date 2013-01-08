
class omeka::service {

  service { 'apache2':
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

