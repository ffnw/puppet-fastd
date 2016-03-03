class fastd::install inherits fastd {

  include apt

  if(!defined(Package['apt-transport-https'])) {
    package { 'apt-transport-https':
      ensure => installed,
    }
  }

  apt::source { 'universe-factory':
    location => 'http://repo.universe-factory.net/debian',
    release  => 'sid',
    repos    => 'main',
    key      => {
      'id'     => '6664E7BDA6B669881EC52E7516EF3F64CB201D9C',
      'server' => 'pgpkeys.mit.edu',
    },
  } ->
  package { 'fastd':
    ensure => 'installed',
  }

  package { 'haveged':
    ensure => 'installed',
  }

}
