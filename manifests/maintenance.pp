# Setup logrotate for carbon_c_relay
class carbon_c_relay::maintenance () {
  logrotate::rule { 'carbon-c-relay':
    path          => '/var/log/carbon/relay.log',
    rotate_every  => 'day',
    missingok     => true,
    rotate        => 7,
    compress      => true,
    delaycompress => false,
    copytruncate  => false,
    ifempty       => false,
    sharedscripts => true,
    postrotate    => '[ ! -f /var/run/carbon/relay.pid ] || /etc/init.d/relay reload',
  }

}
