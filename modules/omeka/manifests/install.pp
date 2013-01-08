
class omeka::install {

  package { 'apache2':
    ensure => installed,
  }

  package { 'mysql-server':
    ensure => installed,
  }

  package { 'php5':
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

