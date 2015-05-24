require 'neo4j'
# point.rb
class Point
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact

  def self.new_points(logistic_mesh)
    logistic_mesh.map do |mesh|
      from = Point.find_or_create_by(name: mesh[:from])
      to = Point.find_or_create_by(name: mesh[:to])
      from.add_new_route(to, mesh[:distance])
    end
  end

  def add_new_route(point, distance)
    Neo4j::Transaction.run do
      create_route_query = "from-[ :route { distance: #{distance} } ]->to"
      Neo4j::Session.query.match(from: { Point: { name: self.name } })
                                 .match(to: { Point: { name: point.name } })
                                 .create_unique(create_route_query).exec

      self
      # self.create_rel(:route, point, distance: distance)
    end
  end
end