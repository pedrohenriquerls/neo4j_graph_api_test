require 'neo4j'
# point.rb
class Point
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact

  def self.new_points(logistic_mesh, map)
    logistic_mesh.map do |mesh|
      from = Point.find_or_create_by(name: mesh[:from])
      to = Point.find_or_create_by(name: mesh[:to])
      from.add_new_route(to, mesh[:distance], map)
    end
  end

  def add_new_route(point, distance, map)
    Neo4j::Transaction.run do
      create_route_query = "from-[ :route { distance: #{distance}, map: '#{map}' } ]->to"
      Neo4j::Session.query.match(from: { Point: { name: name } })
                                .match(to: { Point: { name: point.name } })
                                .create_unique(create_route_query).exec

      return self
      # self.create_rel(:route, point, distance: distance)
    end
  end

  def self.shortest_path(from, to, map)
    Neo4j::Session.query("MATCH (from:Point { name:'#{from}' }), (to:Point { name: '#{to}'}), path = (from)-[:route*]->(to)
                            WHERE filter(route in relationships(path) WHERE route.map = '#{map}')
                            RETURN reduce(p = '', n in nodes(path) | p+n.name+' ' ) AS shortest_path,
                                   reduce(distance = 0, r in relationships(path) | distance+r.distance) AS total_distance
                            ORDER BY total_distance ASC LIMIT 1")
  end
end