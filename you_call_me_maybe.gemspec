# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'you-call-me-maybe'
  gem.version       = '0.0.1'
  gem.authors       = ['Pau Ramon Revilla']
  gem.email         = ['masylum@gmail.com']
  gem.description   = %q{Sane ruby implementation of the Maybe monad}
  gem.summary       = %q{Sane ruby implementation of the Maybe monad}
  gem.homepage      = 'https://github.com/masylum/you-call-me-maybe'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
