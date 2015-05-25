require_relative 'app_base.rb'

# app.rb
# logistic api core
class App < AppBase
  post '/new_map' do
  	logistic_mesh = LogisticMeshHelper.translate params[:logistic_mesh]
  	map_name = params[:name]

  	return prepare_response 'Malha invalida' if logistic_mesh.empty?
  	return prepare_response 'Novo mapa precisa ter um nome' if map_name.nil?

  	begin
	  	new_map = Map.find_or_create_by(name: map_name)

	  	new_points = Point.new_points logistic_mesh, map_name
	  	new_map.add_new_points new_points

	  	return prepare_response 'Malha persistida com sucesso', true
	  rescue StandardError => e
	  	return prepare_response e.message
	  end
  end

  get '/shortest_path' do
    from = params[:from]
    to = params[:to]
    map = params[:map]

    if from.empty? && to.empty? && map.empty?
      return prepare_response 'Parametros invalidos para calcular o caminho.'
    end

    result = Point.shortest_path(from, to, map).first

    if result.nil?
      return prepare_response 'Não é possivel calcular o caminho escolhido'
    end

    total_distance = result[:total_distance]
    shortest_path = result[:shortest_path]

    gas_price = params[:gas_price]
    autonomy = params[:autonomy]
    cost = CostCalculatorHelper.calculate(distance: total_distance,
                                          gas_price: gas_price,
                                          vehicle_autonomy: autonomy)

    if cost.nil?
      return prepare_response 'Parametros invalidos para calcular o custo'
    end

    { success: true,
      path: shortest_path,
      cost: cost,
      distance: total_distance }.to_json
  end

  private

  def prepare_response(message, success = false)
  	{ success: success, message: message }.to_json
  end
end
