# phpldapadmin

[![Build Status](https://travis-ci.org/Spantree/puppet-phpldapadmin.svg?branch=master)](https://travis-ci.org/Spantree/puppet-phpldapadmin)

Sebastian Otaegui <feniix@gmail.com>

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with phpldapadmin](#setup)
    * [What phpldapadmin affects](#what-phpldapadmin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with phpldapadmin](#beginning-with-phpldapadmin)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The phpldapadmin module installs and configures phpldapadmin.

## Module Description

This module installs phpldapadmin, it does not manage or touch the web server configuration.

## Setup

### What phpldapadmin affects

* Install the `phpldapadmin` package.
* Modify the file `/etc/phpldapadmin/config.php` with custom values.

### Beginning with phpldapadmin

`puppet module install spantree-phpldapadmin` and follow the instructions specified on the Usage section.

## Usage

```puppet
class { 'phpldapadmin':
  ldap_host      => 'localhost',
  ldap_suffix    => 'dc=domain,dc=tld',
  ldap_bind_id   => 'cn=admin,dc=domain,dc=tld',
  ldap_bind_pass => 'password',
}
```

## Reference

All internal classes are private the only public class is phpldapadmin

## Limitations

This module has only been tested on Ubuntu 14.04, it should work on Debian and Ubuntu 12.04 too.

At the moment it does not configure the phpldapadmin app with SASL.

## Development

Use your favorite text editor (mine is vim) and run `bundle exec rake test` to test, don't forget to `bundle install` first.

## Release Notes/Contributors/Etc

To do
