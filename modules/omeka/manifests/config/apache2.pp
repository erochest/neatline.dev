
class omeka::config::apache2 {
  $rootdir = $omeka::rootdir
  $debug   = $omeka::debug

  file { 'omeka-site' :
    path    => '/etc/apache2/sites-available/omeka',
    content => template('omeka/omeka-site.erb'),
  }

  exec { 'a2dissite default' :
    path => ['/bin', '/usr/bin', '/usr/sbin'],
  }

  exec { 'a2ensite omeka' :
    path    => ['/bin', '/usr/bin', '/usr/sbin'],
    require => [File['omeka-site'], Exec['a2dissite default']],
    notify  => Service['apache2'],
  }

  exec { 'a2enmod rewrite' :
    path   => ['/bin', '/usr/bin', '/usr/sbin'],
    notify => Service['apache2'],
  }

}

