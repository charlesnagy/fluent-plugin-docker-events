# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "fluent-plugin-dockerevents"
  s.version       = '0.0.3'
  s.authors       = ["Karoly Nagy"]
  s.email         = ["dr.karoly.nagy@gmail.com"]
  s.description   = %q{Docker Event Stream inpupt plugin for Fluentd}
  s.summary       = %q{An input plugin for fluentd collecting Docker events}
  s.homepage      = "https://github.com/charlesnagy/fluent-plugin-docker-events"
  s.license       = 'GNU GENERAL PUBLIC LICENSE'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd", [">= 0.10.49", "< 2"]
  s.add_runtime_dependency "docker-api", [">= 1.32.0", "< 2"]

  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "test-unit"
end
