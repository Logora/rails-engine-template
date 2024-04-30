
require 'factory_bot_rails'
require 'faker'
require 'shoulda/matchers'

FactoryBot.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
end
