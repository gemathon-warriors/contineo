require 'bundler/setup'
Bundler.setup

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
ENV["RAILS_ENV"] ||= 'test'

require 'rspec/autorun'

require 'active_record'

Contineo::CONFIG_PATH = File.join("spec", "fixtures_setup", "config", "database.yml")

# FileUtils.mkdir_p "#{Dir.pwd}/tmp"
ActiveRecord::Base.logger         = Logger.new(StringIO.new)
ActiveRecord::Base.configurations = YAML.load_file(File.join("spec", "fixtures_setup", "config", "database.yml"))
require 'contineo'

`cp -rf spec/fixtures_setup/db .`
require 'fixtures_setup/models/doctor'
require 'fixtures_setup/models/teacher'


# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  # config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
