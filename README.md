# Api de logistica
TODO

##Tech Stack
	- Ruby 2.0.0
  - Sinatra
  - Neo4j

##Como usar
rake neo4j:install[community-2.2.0]
rake neo4j:start

rake neo4j:install[community-2.2.0,test]
rake neo4j:config[test,7475]
rake neo4j:start[test]
rake neo4j:stop[test]