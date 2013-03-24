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

require 'jeweler'
Jeweler::Tasks.new do |gem|
	# gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
	gem.name = "rspec-activerecord"
	gem.homepage = "https://github.com/mpalmer/rspec-activerecord"
	gem.license = "2-clause BSD"
	gem.summary = %Q{ActiveRecord-only support for RSpec}
	gem.email = "mpalmer@hezmatt.org"
	gem.authors = ["Matt Palmer"]
	# dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
	version = File.exist?('VERSION') ? File.read('VERSION') : ""

	rdoc.rdoc_dir = 'rdoc'
	rdoc.title = "rspec-activerecord #{version}"
	rdoc.rdoc_files.include('README*')
	rdoc.rdoc_files.include('lib/**/*.rb')
end
