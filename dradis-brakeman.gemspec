$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'dradis/plugins/brakeman/version'
version = Dradis::Plugins::Brakeman::VERSION.to_s

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = 'dradis-brakeman'
  gem.version     = version
  gem.authors     = ['Daniel Martin']
  gem.email       = ['etd-no_spam-please_nomejortu.com']
  gem.homepage    = 'http://dradisframework.org'
  gem.summary     = 'Brakeman plugin for Dradis Framework'
  gem.description = 'A Dradis Framework upload plugin for the Brakeman security scanner.'

  gem.files = `git ls-files`.split($\)
  # s.files -= Dir['lib/tasks/module_tasks.rake']
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'dradis-core', version

  gem.add_development_dependency 'capybara', '~> 1.1.3'
  gem.add_development_dependency 'database_cleaner'
  gem.add_development_dependency 'factory_girl_rails'
  gem.add_development_dependency 'rspec-rails',  '~> 2.11.0'
  gem.add_development_dependency 'sqlite3'
end
