
class omeka::config {
  $rootdir = $omeka::rootdir
  $debug   = $omeka::debug

  class { 'omeka::config::php'  : } ->
  class { 'omeka::config::mysql': } ->
  class { 'omeka::config::nginx': } ->
  Class['omeka::config']

  file { 'config.ini':
    path    => "$rootdir/Omeka/application/config/config.ini",
    content => template('omeka/config.erb'),
  }

}

