# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contineo/version'

Gem::Specification.new do |spec|
  spec.name          = "contineo"
  spec.version       = Contineo::VERSION::STRING
  spec.authors       = ["Nikhil Nanjappa", "Ashish Upadhyay", "Ankur Gera", "Gourav Tiwari", "Hrishita Vaish"]
  spec.email         = ["nikhil.nanjappa@tcs.com", "ashish.upadhyaye@gmail.com", "ankurgera@gmail.com", "gouravtiwari21@gmail.com", "vaish.hrishita@tcs.com"]
  spec.summary       = %q{Connect rails app to multiple databases with ease}
  spec.description   = %q{Connect rails app to multiple databases with ease, includes sqlite, mysql, oracle etc}
  spec.homepage      = "https://github.com/gemathon-warriors/timezonify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "activerecord",'>= 3.0'
  spec.add_development_dependency "rails",'>= 3.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'coveralls'
end
