
class omeka::install {

  package { 'nginx':
    ensure => installed,
  }

  package { 'mysql-server':
    ensure => installed,
  }

  package { 'php5-fpm':
    ensure => installed,
  }

  package { 'php5-mysql':
    ensure => installed,
  }

  package { 'imagemagick':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

}

