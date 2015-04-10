lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-ucccpd/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday',   ['>= 0.8', '< 0.10']
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_dependency 'oauth2',     '~> 1.0'
  gem.add_dependency 'omniauth',   '~> 1.2'

  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.authors       = ['Joshua F. Rountree']
  gem.email         = ['joshua.rountree@uc.edu']
  gem.description   = 'An OAuth2 Strategy for University of Cincinnati Center for Continuous Professional Development'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/joshuairl/omniauth-ucccpd'
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-ucccpd'
  gem.require_paths = %w(lib)
  gem.version       = OmniAuth::UCCCPD::VERSION
end
