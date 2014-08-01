# == Class: phpldapadmin
#
# Full description of class phpldapadmin here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'phpldapadmin': }
#
# === Authors
#
# Sebastian Otaegui
#
# === Copyright
#
# Copyright 2014 Sebastian Otaegui
#
class phpldapadmin(
  $config_path  = $phpldapadmin::params::config_path,
  $ldap_host = undef,
  $ldap_suffix = undef,
  $ldap_bind_id = undef,
  $ldap_bind_pass = undef,
) inherits phpldapadmin::params {

  validate_absolute_path($config_path)
  validate_string($ldap_host)
  validate_string($ldap_suffix)
  validate_string($ldap_bind_id)
  validate_string($ldap_bind_pass)

  anchor { 'phpldapadmin::begin':
    before => Class['phpldapadmin::package']
  }
  class { 'phpldapadmin::package':
    require => Anchor['phpldapadmin::begin']
  }
  class {'phpldapadmin::config':
    require => Class['phpldapadmin::package']
  }
  anchor {'phpldapadmin::end':
    require => Class['phpldapadmin::config']
  }

}
