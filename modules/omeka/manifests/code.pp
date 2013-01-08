
class omeka::code {
  $branch  = $omeka::branch
  $rootdir = $omeka::rootdir

  file { $rootdir :
    ensure => directory,
  }

  exec { 'omeka-git' :
    cwd     => $rootdir,
    command => "git clone --branch $branch git://github.com/omeka/Omeka.git",
    path    => ['/bin', '/usr/bin/'],
    require => [Class["omeka::install"], File[$rootdir]],
    creates => "$rootdir/Omeka",
  }

  exec { 'omeka-submodules' :
    cwd     => "$rootdir/Omeka",
    command => "git submodule init && git submodule update",
    path    => ['/bin', '/usr/bin'],
    require => [Exec['omeka-git']],
  }

}

