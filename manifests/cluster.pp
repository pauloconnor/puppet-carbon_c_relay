#cluster <name>
#    <forward | any_of [useall] | failover | <carbon_ch | fnv1a_ch> [replication <count>]>
#        <host[:port] [proto <udp | tcp>]> ...
#    ;
#
define carbon_c_relay::cluster(
    $cluster_name               = $title,
    $forward_proto              = 'forward',
    $replication_factor         = 1,
    $hosts                      = [],
  ) {

  validate_string($cluster_name)
  validate_array($hosts)
  validate_re($forward_proto, '^(forward|any_of|failover|carbon_ch|fnv1a_ch)$')
  if !is_numeric($replication_factor){
    fail('$replication_factor must be an integer')
  }

  concat::fragment { "config/cluster-${title}":
    target  => $carbon_c_relay::config_file,
    content => template('carbon_c_relay/config/cluster.erb'),
    order   => '10',
  }
}
