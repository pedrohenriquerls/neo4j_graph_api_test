require_relative 'app_base.rb'

# app.rb
# logistic api core
class App < AppBase
  post '/new_map' do
  	logistic_mesh = LogisticMeshHelper.translate params[:logistic_mesh]
  	name = params[:name]

  	return prepare_response 'Malha invalida' if logistic_mesh.empty?
  	return prepare_response 'Novo mapa precisa ter um nome' if name.nil?

  	begin
	  	new_map = Map.new(name: name)
	  	new_map.save

	  	new_points = Point.new_points logistic_mesh
	  	new_map.add_new_points new_points

	  	return prepare_response 'Malha persistida com sucesso', true
	  rescue StandardError => e
	  	return prepare_response e.message
	  end
  end

  private

  def prepare_response(message, success = false)
  	{ success: success, message: message }.to_json
  end
end
