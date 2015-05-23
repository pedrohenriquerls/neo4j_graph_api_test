# map.rb
# Map to name routes
class Map
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact

  has_many :in, :points
end
