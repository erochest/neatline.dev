
exec { 'apt-get update':
  path => ['/usr/bin'],
}

class { 'omeka':
  rootdir => '/vagrant',
  require => Exec['apt-get update'],
}

omeka::gitplugin { 'NeatlineTime':
  url     => 'git://github.com/scholarslab/NeatlineTime.git',
  require => Class['Omeka'],
}

