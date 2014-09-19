source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']

group :development, :test do
  gem 'rake'
  gem 'puppet'
  gem 'puppet-lint'
  gem 'puppet-syntax'
  gem 'rspec-puppet', :git => 'https://github.com/spantree/rspec-puppet.git'
  #gem 'rspec', '<3.0.0'
  gem 'puppetlabs_spec_helper'
  gem 'puppet-blacksmith'
  gem 'guard-rake'
end

# vim:ft=ruby
