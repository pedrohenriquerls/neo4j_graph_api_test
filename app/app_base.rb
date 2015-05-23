require 'sinatra/base'
require 'yaml'
require 'neo4j'

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
	env = ENV['RACK_ENV'] || 'development'

	set :environment, env
	set :config, config[settings.environment.to_s]

	# db_name = config[env]['db_name']
	# Neo4j::Config[:storage_path] = "db/#{db_name}"
	Neo4j::Session.open(:server_db, 'http://localhost:7474/')
end