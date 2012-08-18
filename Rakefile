# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "kermit"
  gem.homepage = "http://github.com/danielmachado/kermitpfc-core"
  #gem.license = "MIT"
  gem.summary = %Q{Allows to retrieve info from diferent Data Streams}
  gem.description = %Q{Allows to retrieve info from diferent Data Streams for data mining purpouses}
  gem.email = "daniel.machado.fernandez@gmail.com"
  gem.authors = ["Daniel Machado Fernández"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec