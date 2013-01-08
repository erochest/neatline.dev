
class omeka::config::php {
  $rootdir = $omeka::rootdir

  file { '10-fix_pathinfo.ini' :
    path    => "/etc/php5/conf.d/10-fix_pathinfo.ini",
    content => "cgi.fix_pathinfo=0\n",
    require => Class['omeka::install'],
  }

}

