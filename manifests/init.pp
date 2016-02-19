class fastd (
  
) inherits fastd::params {

  contain fastd::install
  contain fastd::config

  class { 'fastd::install': } ->
  class { 'fastd::config': }

  create_resources('fastd::instance', hiera('fastd::instance', {}))

}
