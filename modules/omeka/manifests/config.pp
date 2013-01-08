
class omeka::config {
  $rootdir = $omeka::rootdir
  $debug   = $omeka::debug

  class { 'omeka::config::php'    : } ->
  class { 'omeka::config::mysql'  : } ->
  class { 'omeka::config::apache2': } ->
  Class['omeka::config']

  file { 'db.ini':
    path    => "$rootdir/Omeka/db.ini",
    ensure  => file,
    mode    => 0644,
    content => template('omeka/db.erb'),
    notify  => Class['omeka::service'],
  }

  file { 'config.ini':
    path    => "$rootdir/Omeka/application/config/config.ini",
    content => template('omeka/config.erb'),
  }

  file { '.htaccess' :
    path   => "$rootdir/Omeka/.htaccess",
    source => "$rootdir/Omeka/.htaccess.changeme",
  }

  file { 'files' :
    path    => "$rootdir/Omeka/files",
    ensure  => directory,
    recurse => true,
    mode    => 0777,
    owner   => 'www-data',
    group   => 'www-data',
  }

}

