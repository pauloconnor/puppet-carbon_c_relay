#match <* | <expression>>
#    send to <cluster | blackhole>
#    [stop]
#    ;
#
define carbon_c_relay::match(
    $rule                      = '*',
    $send_to                   = 'blackhole',
    $stop                      = false,
  ) {

  validate_string($send_to)
  if !is_bool($stop){
    fail('$stop must be an boolean')
  }

  concat::fragment { "c_config/match-${title}":
    target  => $carbon_c_relay::config_file,
    content => template('carbon_c_relay/config/match.erb'),
    order   => '20',
  }
}
