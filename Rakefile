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

require 'git-version-bump/rake-tasks'

Bundler::GemHelper.install_tasks

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
	rdoc.title = "rspec-activerecord #{GVB.version}"
	rdoc.rdoc_files.include('README*')
	rdoc.rdoc_files.include('lib/**/*.rb')
end
