ENV['RACK_ENV'] = 'development'

require './app'
require 'rack/test'
require 'simplecov'
require 'simplecov-console'
require 'sinatra/base'
require 'test_database_setup'
# require 'test_database_setup'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do
    test_database_setup
  end

  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
