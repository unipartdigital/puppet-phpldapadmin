# == Class: phpldapadmin::params
#
# Full description of class phpldapadmin::params here.
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
# === Authors
#
# Sebastian Otaegui
#
# === Copyright
#
# Copyright 2014 Sebastian Otaegui
#
class phpldapadmin::params {

  case $::osfamily {
    'Debian': {
      $path = '/var/www/phpldapadmin'
    }

    default: {
      fail("Unsupported OS family ${::osfamily}")
    }
  }
}
