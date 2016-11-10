# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'weatai/version'

Gem::Specification.new do |s|
  s.name        =  'weatai'
  s.version     =  CWB::VERSION

  s.summary     =  'Get weather content from central weather bureau(Taiwan);'
  s.description =  'Extracts temperature and humidity for different city'
  s.authors     =  ['soainfinite888']
  s.email       =  ['lisa5432126@gmail.com']

  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- spec/*`.split("\n")
  s.executables << 'weatai'

  s.add_runtime_dependency 'http', '~> 2.0'
  s.add_runtime_dependency 'activesupport', '~>4.2', '>= 4.2.6'

  s.add_development_dependency 'minitest', '~> 5.9'
  s.add_development_dependency 'minitest-rg', '~> 5.2'
  s.add_development_dependency 'rake', '~> 11.3'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'flog', '~> 4.4'
  s.add_development_dependency 'flay', '~> 2.8'
  s.add_development_dependency 'rubocop', '~> 0.42'

  s.homepage    =  'https://github.com/soainfinite888/weatai'
  s.license     =  'MIT'
end
