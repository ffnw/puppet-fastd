class fastd (
  
) inherits fastd::params {

  require fastd::install
  require fastd::config

  create_resources('fastd::instance', hiera('fastd::instance', {}))

}
