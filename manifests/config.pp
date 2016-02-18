class fastd::config inherits fastd {

  file {
    default:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644';
    '/etc/fastd/up.sh':
      mode    => '0755',
      source => 'puppet:///modules/fastd/blacklist.sh';
    "/etc/fastd/${title}/fastd.conf":
      source => 'puppet:///modules/fastd/blacklist.json';
  }

}
