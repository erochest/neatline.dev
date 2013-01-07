
class omeka::config {
  class { 'omeka::config::mysql': } ->
  Class['omeka::config']
}

