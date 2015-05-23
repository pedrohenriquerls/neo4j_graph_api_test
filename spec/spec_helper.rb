require 'rack/test'
require 'rspec'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require_relative '../app/app.rb'

# spec_helper.rb
module RSpecMixin
  include Rack::Test::Methods
  def app
    App
  end
end

Dir['../app/models/**/*.rb'].each do |model|
  load model
end

RSpec.configure do |config|
	config.include Rack::Test::Methods
	config.include RSpecMixin

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.orm = 'neo4j'
  end
  
  config.after(:all) do
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end
end