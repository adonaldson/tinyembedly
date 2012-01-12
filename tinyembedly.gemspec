# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tinyembedly/version"

Gem::Specification.new do |s|
  s.name        = "tinyembedly"
  s.version     = Tinyembedly::VERSION
  s.authors     = ["Andrew Donaldson"]
  s.email       = ["andrew@desto.net"]
  s.homepage    = ""
  s.summary     = %q{Fetch Embedly oEmbed data}
  s.description = %q{A super tiny Embedly oEmbed library, using HTTParty}

  s.rubyforge_project = "tinyembedly"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "httparty", ">= 0.5.0"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "mocha"
end
