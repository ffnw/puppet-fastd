class fastd::service inherits fastd {

  service { 'fastd':
    enable => false,
    ensure => stopped,
  }

}

