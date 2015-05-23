require 'rack/test'
require 'rspec'
require_relative '../app/app.rb'

# spec_helper.rb
module RSpecMixin
  include Rack::Test::Methods
  def app
  	App
  end
end

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
	config.include Rack::Test::Methods
	config.include RSpecMixin
end