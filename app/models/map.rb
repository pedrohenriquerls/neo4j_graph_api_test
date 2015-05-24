# map.rb
# Map to name routes
class Map
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact

  has_many :both, :points

  def add_new_points(points)
  	self.points = points
  	save
  end
end
