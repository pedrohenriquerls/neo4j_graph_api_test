require 'rack/test'
require 'rspec'

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
end