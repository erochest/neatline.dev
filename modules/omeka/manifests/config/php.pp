
class omeka::config::php {
  file { '10-fix_pathinfo.ini' :
    path    => "/etc/php5/conf.d/10-fix_pathinfo.ini",
    content => "cgi.fix_pathinfo=0\n",
    require => Class['omeka::install'],
    notify  => Service['php5-fpm'],
  }
}

