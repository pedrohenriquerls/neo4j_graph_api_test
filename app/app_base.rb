require 'sinatra/base'
require 'yaml'

# application.rb
# Configs loader
class AppBase < Sinatra::Base
	set :root, settings.root + '/..'
	Dir[settings.root + '/lib/*.rb'].each { |file| require file }
	Dir[settings.root + '/app/helpers/*.rb'].each { |path| require path }
	Dir[settings.root + '/app/models/*.rb'].each do |path|
	  require path
	end

	# Load config.yml into settings.config variable
	config = YAML.load_file("#{settings.root}/config/config.yml")
	set :config, config[settings.environment.to_s]
	set :environment, ENV['RACK_ENV'] || 'development'
end