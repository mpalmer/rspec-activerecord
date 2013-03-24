Support for using ActiveRecord within RSpec as a standalone module (*without*
Rails).

# Usage

Put this somewhere in your `spec_helper.rb` (or similar):

    require 'rspec-activerecord'

Then use the `fixtures` method and your helpers as per normal.


# Configuration

    RSpec.configure do |c|
      c.use_transactional_fixtures = true / false
      c.use_instantiated_fixtures = true / false
      c.fixture_path = "some/path"
      c.global_fixtures = [:foo, :bar]
    end


# Enhancements

Make the changes you want, then [Submit a pull request on
Github](https://github.com/mpalmer/rspec-activerecord/pulls).  I don't
accept bug reports; if something breaks, you get to keep both pieces.


# Licence

Since this gem is essentially nothing more than big chunks of the
`rspec-rails` gem, this code is licenced under the same terms as that gem,
as described in `LICENCE`.
