
class omeka::config::nginx {
  $rootdir = $omeka::rootdir
  $debug   = $omeka::debug

  file { 'omeka-site':
    path    => '/etc/nginx/sites-available/omeka-site',
    content => template('omeka/omeka-site.erb'),
  }

  exec { 'omeka-site':
    command => 'rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/omeka-site /etc/nginx/sites-enabled',
    path    => ['/bin', '/usr/bin'],
    require => File['omeka-site'],
    notify  => Service['nginx'],
    creates => '/etc/nginx/sites-enabled/omeka-site',
  }

}

