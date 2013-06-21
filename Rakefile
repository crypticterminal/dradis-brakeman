require 'bundler/gem_tasks'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the brakeman_upload plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the brakeman_upload plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BrakemanUpload'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


desc 'Generates a dummy app for testing'
task :dummy_app => [:setup, :migrate]

task :setup do
  require 'rails'
  require 'dradis_core'
  require 'dradis/generators/dummy/dummy_generator'

  dummy = File.expand_path('../spec/dummy', __FILE__)

  sh "rm -rf #{dummy}"
  Dradis::DummyGenerator.start(
    %W(. --quiet --force --skip-bundle --dummy-path=#{dummy})
  )
end

# re: name, see:
#   https://github.com/rails/rails/blob/master/railties/lib/rails/generators/rails/plugin_new/plugin_new_generator.rb#L245-L255
task :migrate do
  rakefile = File.expand_path('../spec/dummy/Rakefile', __FILE__)
  plugin_name = File.basename('')

  # dradis_core migrations
  sh("rake -f #{rakefile} dradis:install:migrations")

  # this gem's migrations
  if Dir[ File.expand_path('../db/migrate/*', __FILE__) ].empty?
    puts "Skipping :migrate as this plugin doesn't define any migrations"
  else
    # TODO: hard-coded plugin name ahead!
    sh("rake -f #{rakefile} #{plugin_name}:install:migrations")
  end
  sh("rake -f #{rakefile} db:create db:migrate db:test:prepare")
end