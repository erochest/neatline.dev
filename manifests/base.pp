
exec { 'apt-get update':
  path => ['/usr/bin'],
}

class { 'omeka':
  rootdir          => '/vagrant',
}

omeka::gitplugin { 'NeatlineTime':
  url     => 'git://github.com/scholarslab/NeatlineTime.git',
  require => Class['Omeka'],
}

