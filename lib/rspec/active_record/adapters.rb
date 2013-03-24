module RSpec
	module ActiveRecord
		module SetupAndTeardownAdapter
			extend ::ActiveSupport::Concern
						
			module ClassMethods
				def setup(*methods)
					methods.each do |m|
						if m == :setup_fixtures
							prepend_before { send m }
						else
							before         { send m }
						end
					end
				end
				
				def teardown(*methods)
					methods.each { |m| after { send m } }
				end
			end
			
			def method_name
				@example
			end
		end
	end
end
