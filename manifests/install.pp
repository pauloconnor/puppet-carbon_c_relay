# Install the package
class carbon_c_relay::install {
  package { 'carbon-c-relay':
    ensure => $carbon_c_relay::version,
  }
}
