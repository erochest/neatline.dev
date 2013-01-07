
define omeka::gitplugin($url, $branch='master') {
  $rootdir = $omeka::rootdir

  exec { "$name-git":
    cwd     => "$rootdir/Omeka/plugins",
    command => "git clone --branch $branch $url $name",
    path    => ['/usr/bin'],
    require => Class['Omeka'],
    creates => "$rootdir/Omeka/plugins/$name",
  }

}

