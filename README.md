# Grapho API
####Techstack
  - Neo4j
  - Ruby 2.2.1
  - Sinatra

##Api
#####Post: /new_map
Params: to, from, logistic_mesh, name
>Example:
>wget --base="localhost:3000/new_map" --referer="localhost:3000/new_map" --post-data="name=SP&logistic_mesh[]=A B 10&logistic_mesh[]=B D 15&logistic_mesh[]=A C 20&logistic_mesh[]=C D 30&logistic_mesh[]=B E 50&logistic_mesh[]=D E 30" localhost:3000/new_map

>Response: {"success":true,"message":"Malha persistida com sucesso"}

#####Get: /shortest_path
Params: to, from, map, gas_price, autonomy
>Example:
>wget "localhost:3000/shortest_path?from=A&to=D&autonomy=10&gas_price=2.50&map=SP"

>Response: {"success":true,"path":"A B D ","cost":6.25,"distance":25.0}

##How to use
####Tests
  - bundle install
  - rake neo4j:install[community-2.2.0,test]
  -  editar o arquivo /db/neo4j/test/conf/neo4j-server.properties
> dbms.security.auth_enabled=false
  - rake neo4j:config[test,7475]
  - rake neo4j:start[test]
  - rspec

####Running Server
  - bundle install
  - rake neo4j:install[community-2.2.0]
  - edit file /db/neo4j/development/conf/neo4j-server.properties
> dbms.security.auth_enabled=false
  -  rake neo4j:start
  -  rake server
