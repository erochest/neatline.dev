
class omeka::code {
  $branch  = $omeka::branch
  $rootdir = $omeka::rootdir

  exec { 'omeka-rootdir':
    command => "mkdir $rootdir",
    path    => ['/bin'],
    creates => $rootdir,
  }

  exec { 'omeka-git':
    cwd     => $rootdir,
    command => "git clone --branch $branch git://github.com/omeka/Omeka.git && git submodule init && git submodule update",
    path    => ['/usr/bin/'],
    require => [Class["omeka::install"], Exec['omeka-rootdir']],
    creates => "$rootdir/Omeka",
  }

}

