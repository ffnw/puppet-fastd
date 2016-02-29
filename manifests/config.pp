class fastd::config inherits fastd {

  file { '/etc/fastd/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->
  file {
    default:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644';
    '/etc/fastd/blacklist.sh':
      mode    => '0755',
      source => 'puppet:///modules/fastd/blacklist.sh';
    "/etc/fastd/blacklist.json":
      source => 'puppet:///modules/fastd/blacklist.json';
  }

}
