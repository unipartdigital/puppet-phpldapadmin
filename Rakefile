require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'coveralls/rake/task'

exclude_paths = [
  "spec/**/*.pp",
  "vendor/**/*.pp",
  "pkg/**/*.pp"
]
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send('disable_class_inherits_from_params_class')

PuppetLint.configuration.ignore_paths = exclude_paths

PuppetSyntax.exclude_paths = exclude_paths

Coveralls::RakeTask.new
