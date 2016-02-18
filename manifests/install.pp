class fastd::install {

  include apt

  apt::source { 'universe-factory':
    location => 'http://repo.universe-factory.net/debian',
    release  => 'sid',
    repos    => 'main',
    key      => {
      'id'     => '16EF3F64CB201D9C',
      'server' => 'pgpkeys.mit.edu',
    },
  }

  package { 'fastd':
    ensure => 'installed',
  }

}
