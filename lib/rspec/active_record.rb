require 'active_record/fixtures'
require 'rspec/active_record/adapters'

module RSpec
	module ActiveRecord
		module FixtureSupport
			extend  ::ActiveSupport::Concern
			include ::RSpec::ActiveRecord::SetupAndTeardownAdapter
			include ::ActiveRecord::TestFixtures
			
			included do
				%w{fixture_path use_transactional_fixtures
				   use_instantiated_fixtures pre_loaded_fixtures}.each do |param|
					self.send("#{param}=".to_sym, RSpec.configuration.send(param.to_sym))
				end
				
				%w{fixture_table_names fixture_class_names}.each do |param|
					if RSpec.configuration.send(param.to_sym)
						self.send("#{param}=".to_sym, RSpec.configuration.send(param.to_sym))
					end
				end
				
				if RSpec.configuration.global_fixtures
					fixtures RSpec.configuration.global_fixtures
				end
			end
		end
		
		RSpec.configure do |c|
			c.include RSpec::ActiveRecord::FixtureSupport
			
			c.add_setting :use_transactional_fixtures, :alias_with => :use_transactional_examples
			c.add_setting :use_instantiated_fixtures
			c.add_setting :pre_loaded_fixtures
			c.add_setting :global_fixtures
			c.add_setting :fixture_path
			c.add_setting :fixture_table_names
			c.add_setting :fixture_class_names
		end
	end
end
