# == Class: phpldapadmin::config
#
# Full description of class phpldapadmin:config here.
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
# === Authors
#
# Sebastian Otaegui
# Seth Tunstall
#
# === Copyright
#
# Copyright 2019 Sebastian Otaegui, Seth Tunstall
# 
class phpldapadmin::config(
  $config_path    = $phpldapadmin::config_path,
  $ldap_suffix    = undef,
  $ldap_host      = $phpldapadmin::ldap_host,
  $ldap_bind_id   = undef,
  $ldap_bind_pass = undef,
  $extraconf      = $phpldapadmin::extraconf,
  $session_id     = undef,
) {
  
  #$session_id     = autosecret::sha1('phpldapadmin', 'user') # Custom function for secret generation
  $logo_file      = '/usr/share/phpldapadmin/htdocs/images/default/logo-small.png'

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { "${phpldapadmin::config_path}/config.php":
    ensure  => file,
    content => template("${module_name}/config.php.erb"),
    path    => "${phpldapadmin::config_path}/config.php",
    owner   => 'root',
    group   => $phpldapadmin::params::config_group,
    mode    => '0640',
  }
  # Drop a cheeky logo in place :)
  file { $logo_file:
    ensure  => file,
    source  => "puppet:///modules/${module_name}${logo_file}",
    replace => true,
  }
  selinux::boolean { 'httpd_can_connect_ldap': }
}
