# features/support/env.rb

require 'cucumber/rails'
require 'factory_bot'

# Capybara settings (optional but useful)
Capybara.default_max_wait_time = 5 # seconds
Capybara.server = :puma # Faster server for tests

World(FactoryBot::Syntax::Methods)

# Ensure DatabaseCleaner is loaded if you use it
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "Add 'database_cleaner' gem to your Gemfile if you want database cleaning."
end

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end