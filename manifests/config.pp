#carbon_c_relay config
class carbon_c_relay::config () {

  file { $carbon_c_relay::log_file:
    ensure      => 'present',
    owner       => 'www-data',
    group       => 'www-data',
  }

  file { '/etc/init.d/relay':
    ensure      => 'present',
    owner       => 'root',
    group       => 'root',
    content     => template('carbon_c_relay/relay.init.erb')
  }

  concat { $carbon_c_relay::config_file:
    ensure      => present,
    owner       => 'root',
    group       => 'root',
    mode        => '0644',
    notify      => Service['relay']
  }

  concat::fragment { '01-relay-header':
    target      => $carbon_c_relay::config_file,
    order       => '01',
    content     => "# This file managed by Puppet\n# Go bug poc@yelp.com if you have questions\n#\n",
  }

}
