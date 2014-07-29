# == Class: phpldapadmin::package
#
# === Authors
#
# Sebastian Otaegui
#
# === Copyright
#
# Copyright 2014 Sebastian Otaegui
#
class phpldapadmin::package {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  case $::osfamily {
    'Debian': {
      package { 'phpldapadmin':
        ensure => latest,
      }
    }

    default: {
      fail("Unsupported OS family ${::osfamily}")
    }
  }
}
