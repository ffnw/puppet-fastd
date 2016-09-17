class fastd::install inherits fastd {

  include apt
  include apt::backports

  package { 'fastd':
    ensure => 'installed',
  } ->
  file { '/lib/systemd/system/fastd@.service':
    ensure  => link,
    target  => '/lib/systemd/system/fastd.service',
    replace => false
  }

  package { 'haveged':
    ensure => 'installed',
  }

}
