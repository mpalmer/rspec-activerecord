require 'active_record/fixtures'
require 'rspec/active_record/adapters'

module RSpec
	module ActiveRecord
		module FixtureSupport
			extend  ::ActiveSupport::Concern
			include ::RSpec::ActiveRecord::SetupAndTeardownAdapter
			include ::ActiveRecord::TestFixtures
			
			included do
				self.fixture_path = RSpec.configuration.fixture_path
				self.use_transactional_fixtures = RSpec.configuration.use_transactional_fixtures
				self.use_instantiated_fixtures  = RSpec.configuration.use_instantiated_fixtures
				self.pre_loaded_fixtures        = RSpec.configuration.pre_loaded_fixtures
				fixtures RSpec.configuration.global_fixtures if RSpec.configuration.global_fixtures
			end
		end
		
		RSpec.configure do |c|
			c.include RSpec::ActiveRecord::FixtureSupport
			
			c.add_setting :use_transactional_fixtures, :alias_with => :use_transactional_examples
			c.add_setting :use_instantiated_fixtures
			c.add_setting :pre_loaded_fixtures
			c.add_setting :global_fixtures
			c.add_setting :fixture_path
		end
	end
end
