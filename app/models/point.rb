# point.rb
class Point
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact
end