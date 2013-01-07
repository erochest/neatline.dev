
class omeka::install {

  package { 'nginx':
    ensure => installed,
  }

  package { 'mysql-server':
    ensure => installed,
  }

  package { 'imagemagick':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

}

