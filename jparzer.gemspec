# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jparzer/version"

Gem::Specification.new do |s|
  s.name        = "jparzer"
  s.version     = Jparzer::VERSION
  s.authors     = ["Rolando Alvarado"]
  s.email       = ["rorroland@gmail.com"]
  s.homepage    = "https://github.com/rolandoalvarado/jparzer"
  s.summary     = %q{Process data from a json file.}
  s.description = %q{Jparzer is a simple gem for parsing a json file with custom search capability.}

  s.rubyforge_project = "jparzer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
