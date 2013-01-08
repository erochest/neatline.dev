
class omeka::config {
  class { 'omeka::config::mysql': } ->
  class { 'omeka::config::nginx': } ->
  Class['omeka::config']
}

