
class omeka::config::mysql {
  $rootdir  = $omeka::rootdir
  $dbuser   = $omeka::dbuser
  $dbpass   = $omeka::dbpass
  $dbname   = $omeka::dbname
  $dbprefix = $omeka::dbprefix

  file { 'db.ini':
    path    => "$rootdir/Omeka/db.ini",
    mode    => 644,
    content => template('omeka/db.erb'),
    notify  => Class['omeka::service'],
  }

  file { 'create-database.sql':
    path    => '/tmp/create-database.sql',
    content => template('omeka/create-database.erb'),
  }

  exec { 'create-database':
    command => 'mysql < /tmp/create-database.sql',
    path    => ['/usr/bin'],
    require => File['create-database.sql'],
  }

}

