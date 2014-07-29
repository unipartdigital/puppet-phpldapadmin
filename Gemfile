source ENV['GEM_SOURCE'] || 'https://rubygems.org'

if puppetversion = ENV['PUPPET_GEM_VERSION']
    gem 'puppet', puppetversion, :require => false
else
    gem 'puppet', :require => false
end

group :development, :test do
  gem 'rake',                      :require => false
  gem 'puppet-lint',               :require => false
  gem 'puppet-syntax',             :require => false
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git',   :require => false
  gem 'rspec', '2.99.0',           :require => false
  gem 'puppetlabs_spec_helper',    :require => false
end

# vim:ft=ruby
