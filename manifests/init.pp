class fastd (
  
) inherits fastd::params {

  include batman

  class { 'fastd::install': } ->
  class { 'fastd::config': } ->
  class { 'fastd::service': }

  contain fastd::install
  contain fastd::config
  contain fastd::service

  create_resources('fastd::instance', hiera('fastd::instance', {}))

}
