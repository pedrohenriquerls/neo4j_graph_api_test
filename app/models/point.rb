# point.rb
class Point
  include Neo4j::ActiveNode
  property :name, type: String, index: :exact

  def self.translate(mesh)
    mesh_list = mesh.collect { |info| info.split(/\W+/) }
    mesh_list.map do |info|
    	{ from: info[0], to: info[1], distance: info[2].to_f }
    end
  end
end