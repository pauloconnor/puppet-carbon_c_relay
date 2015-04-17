# Install the package
class carbon_c_relay::install {
  package { 'carbon_c_relay':
    ensure => $carbon_c_relay::version,
  }
}
