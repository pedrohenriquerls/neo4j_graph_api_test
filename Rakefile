#!/usr/bin/env rake
# Rake file to help with development
# Add files as lib/tasks/*.rake
require 'neo4j'
load 'neo4j/tasks/neo4j_server.rake'

Dir.glob('lib/tasks/*.rake').each { |r| import r }
