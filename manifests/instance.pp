define fastd::instance (
  String  $interface        = "fastd-${title}",
  Integer $port             = 10000,
  Integer $peer_limit       = 100,
  String  $batman_interface = 'bat0',
) {

  include fastd
  include fastd::params

  file {
    default:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755';
    "/etc/fastd/${title}/":;
    "/etc/fastd/${title}/static/":;
  } ->
  exec { "fastd_generate-key_${title}":
    command => "/usr/bin/printf 'secret \"%s\";\\n' \$(/usr/bin/fastd --generate-key --machine-readable) > /etc/fastd/${title}/secret.conf",
    unless  => "/usr/bin/test -e /etc/fastd/${title}/secret.conf",
  } ->
  file {
    default:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644';
    "/etc/fastd/${title}/up.sh":
      mode    => '0744',
      content => epp('fastd/up.epp', { interface => $interface, batman_interface => $batman_interface });
    "/etc/fastd/${title}/down.sh":
      mode    => '0744',
      content => epp('fastd/down.epp', { interface => $interface, batman_interface => $batman_interface });
    "/etc/fastd/${title}/fastd.conf":
      content => epp('fastd/instance.epp', { interface => $interface, port => $port, peer_limit => $peer_limit });
  } ->
  service { "fastd@${title}":
    ensure => running,
  }

}
