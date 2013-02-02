# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_google_custom_search/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_google_custom_search"
  gem.version       = SimpleGoogleCustomSearch::VERSION
  gem.authors       = ["Cher Wei Soh"]
  gem.email         = ["cherwei.soh@gmail.com"]
  gem.description   = %q{With Simple Google Custom Search, add a search box to your homepage to help people find what they need on your website}
  gem.summary       = %q{Simple Google Query Search API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "hpricot"
end
