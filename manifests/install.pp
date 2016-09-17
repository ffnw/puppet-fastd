class fastd::install inherits fastd {

  include apt
  include apt::backports

  apt::pin { 'fastd jessie-backports':
    label    => 'jessie-backports',
    priority => 500,
    packages => [ 'fastd' ]
  }

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
