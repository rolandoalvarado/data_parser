$:.push File.expand_path('../lib', __FILE__)
require 'data_parser/version'

Gem::Specification.new do |s|
  s.name        = 'data_parser'
  s.version     = DataParser::VERSION
  s.authors     = ['Rolando Alvarado']
  s.email       = ['rorroland@gmail.com']
  s.homepage    = 'https://github.com/rolandoalvarado/data_parser'
  s.summary     = %q{Process data from a json file.}
  s.description = %q{DataParser is a simple code for parsing a json file with search capabilty for partial or full name and showing of duplicate email if there is.}

  s.rubyforge_project = 'data_parser'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
