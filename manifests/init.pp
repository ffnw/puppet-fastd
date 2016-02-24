class fastd (
  
) inherits fastd::params {

  class { 'fastd::install': } ->
  class { 'fastd::config': }

  contain fastd::install
  contain fastd::config

  create_resources('fastd::instance', hiera('fastd::instance', {}))

}
