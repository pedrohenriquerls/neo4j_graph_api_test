
# helpers/logistict_mesh_helper.rb
# Methods to translate and validate any logistic mesh
class LogisticMeshHelper
	def self.translate(mesh)
		mesh_list = mesh.collect { |info| info.split(/\W+/) }
		mesh_list.map do |info|
			{ from: info[0], to: info[1], distance: info[2].to_f } if valid? info
		end
	end

	def self.valid?(info)
  	return false unless info.count == 3
  	!info[0].empty? && !info[1].empty? && number?(info[2])
  end

  def self.number?(number)
    true if Float(number) rescue false
  end
end