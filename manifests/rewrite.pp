#rewrite <expression>
#    into <replacement>
#    ;
#
define carbon_c_relay::rewrite(
    $expression                    = '',
    $replacement                   = '',
  ) {

  validate_string($expression)
  validate_string($replacement)

  concat::fragment { "config/rewrite-${title}":
    target  => $carbon_c_relay::config_file,
    content => template('carbon_c_relay/config/rewrite.erb'),
    order   => '30',
  }
}
