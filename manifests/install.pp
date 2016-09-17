class fastd::install inherits fastd {

  include apt
  include apt::backports

  package { 'fastd':
    ensure => 'installed',
  } ->
  file { '/lib/systemd/system/fastd@.service':
    ensure  => present,
    source  => '/lib/systemd/system/fastd.service'
  }

  package { 'haveged':
    ensure => 'installed',
  }

}
