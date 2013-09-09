Gem::Specification.new do |s|
	s.name = "rspec-activerecord"
	s.version = "0.0.0"

	s.authors = ["Matt Palmer"]
	s.date = "2013-03-24"
	s.email = "mpalmer@hezmatt.org"
	s.extra_rdoc_files = [
		"README.md"
	]
	s.files = [
		"LICENCE",
		"README.md",
		"lib/rspec-activerecord.rb",
		"lib/rspec/active_record.rb"
	]
	s.homepage = "https://github.com/mpalmer/rspec-activerecord"
	s.licenses = ["GPLv3"]
	s.require_paths = ["lib"]
	s.summary = "ActiveRecord-only support for RSpec"

	s.add_runtime_dependency 'activerecord', '~> 3.1'

	s.add_development_dependency "bundler", "~> 1.0"
	s.add_development_dependency "rdoc", "~> 2.5"
end
