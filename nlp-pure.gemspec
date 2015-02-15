# encoding: utf-8
require File.expand_path('../lib/nlp_pure/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Reid Parham']
  gem.email         = ['reid.parham@gmail.com']
  gem.description   = gem.summary = 'Natural language processing algorithms implemented in pure Ruby with minimal dependencies'
  gem.homepage      = 'https://github.com/parhamr/nlp-pure'
  gem.license       = 'MIT'

  gem.executables   = []
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- spec/*`.split("\n")
  gem.name          = 'nlp-pure'
  gem.require_paths = ['lib']
  gem.version       = NlpPure::VERSION
  gem.add_development_dependency      'rake', '~> 10.4'
  gem.add_development_dependency      'minitest', '~> 5.5'
  gem.add_development_dependency      'coveralls', '~> 0.7'
end
