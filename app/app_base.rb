require 'sinatra/base'
require 'yaml'
require 'neo4j'

# app_base.rb
# Configs loader
class AppBase < Sinatra::Base
	env = ENV['RACK_ENV'] || 'development'
	neo4j_url = 'http://localhost:'
	neo4j_url = env == 'test' ? "#{neo4j_url}7475" : "#{neo4j_url}7474"
	Neo4j::Session.open(:server_db, neo4j_url)

	set :root, settings.root + '/..'
	Dir[settings.root + '/lib/*.rb'].each { |file| require file }
	Dir[settings.root + '/app/helpers/*.rb'].each { |path| require path }
	Dir[settings.root + '/app/models/*.rb'].each do |path|
	  load path
	end

	# Load config.yml into settings.config variable
	config = YAML.load_file("#{settings.root}/config/config.yml")

	set :environment, env
	set :config, config[settings.environment.to_s]
end