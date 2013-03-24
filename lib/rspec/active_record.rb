require 'active_record/fixtures'

module RSpec
	module ActiveRecord
		module FixtureSupport
			include ::ActiveRecord::TestFixtures
			
			class << self
				def setup(*methods)
					methods.each do |method|
						if method == :setup_fixtures
							prepend_before { send method }
						else
							before         { send method }
						end
					end
				end
				
				def teardown(*methods)
					methods.each { |m| after { send method } }
				end
			end
			
			def method_name
				@example
			end
			
			included do
				self.fixture_path = RSpec.configuration.fixture_path
				self.use_transactional_fixtures = RSpec.configuration.use_transactional_fixtures
				self.use_instantiated_fixtures  = RSpec.configuration.use_instantiated_fixtures
				fixtures RSpec.configuration.global_fixtures if RSpec.configuration.global_fixtures
			end
		end
		
		RSpec.configure do |c|
			c.include RSpec::ActiveRecord::FixtureSupport
			
			c.add_setting :use_transactional_fixtures, :alias_with => :use_transactional_examples
			c.add_setting :use_instantiated_fixtures
			c.add_setting :global_fixtures
			c.add_setting :fixture_path
		end
	end
end
