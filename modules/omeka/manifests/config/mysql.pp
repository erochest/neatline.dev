
class omeka::config::mysql {
  $rootdir  = $omeka::rootdir
  $dbuser   = $omeka::dbuser
  $dbpass   = $omeka::dbpass
  $dbname   = $omeka::dbname
  $dbprefix = $omeka::dbprefix

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

