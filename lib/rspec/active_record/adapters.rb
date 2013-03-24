module RSpec
	module ActiveRecord
		module SetupAndTeardownAdapter
			extend ::ActiveSupport::Concern
						
			module ClassMethods
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
		end
	end
end
