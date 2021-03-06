class fastd::install inherits fastd {

  include apt
  include apt::backports

  apt::pin { 'fastd from jessie-backports':
    release  => 'jessie-backports',
    priority => 500,
    packages => [ 'fastd' ]
  } ->
  package { 'fastd':
    ensure => latest,
  } ->
  file { '/lib/systemd/system/fastd@.service':
    ensure  => present,
    source  => '/lib/systemd/system/fastd.service'
  }

  package { 'haveged':
    ensure => 'installed',
  }

}
