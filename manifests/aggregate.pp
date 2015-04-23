#aggregate
#        <expression> ...
#    every <interval> seconds
#    expire after <expiration> seconds
#    compute <sum | count | max | min | average> write to
#        <metric>
#    [compute ...]
#    ;
#
# Don't use this, or you'll make me sad.
#
define carbon_c_relay::aggregate(
    $expression     = '',
    $interval       = 60,
    $expiration     = 300,
    $compute        = 'sum',
    $metric         = '',
  ) {

  validate_re($compute, '^(sum|count|max|min|average)$')
  if !is_integer($interval) {
    fail('$interval must be an integer')
  }
  if !is_integer($expiration) {
    fail('$interval must be an integer')
  }
  validate_string($expression)
  validate_string($compute)
  validate_string($metric) # This is a regex though

  concat::fragment { "config/rewrite-${title}":
    target  => $carbon_c_relay::config_file,
    content => template('carbon_c_relay/config/aggregate.erb'),
    order   => 'd',
  }
}
