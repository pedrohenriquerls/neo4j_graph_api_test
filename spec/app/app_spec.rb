require_relative '../spec_helper'
require_relative '../../app/models/map.rb'
require_relative '../support/logistic_mesh.rb'

describe 'Logistic mesh api' do
	include LogisticMesh

	context '/new_map' do
	  it 'invalid map' do
	    post '/new_map', logistic_mesh: []

	    expect(response['success']).to be(false)
	    expect(response['message']).to eq('Malha invalida')
	  end

	  it 'valid map without name' do
	  	post '/new_map', logistic_mesh: test_sample

	  	expect(response['success']).to be(false)
	  	expect(response['message']).to eq('Novo mapa precisa ter um nome')
	  end

	  it 'valid map with name' do
	  	post('/new_map', logistic_mesh: test_sample, name: 'Tudo')

	  	expect(response['success']).to be(true)
	  	expect(response['message']).to eq('Malha persistida com sucesso')

	  	expect(Map.find_by(name: 'Tudo')).to_not be_nil
	  end
	end

	context '/shortest_path' do
		it 'to A from D' do
			params = { from: 'A', to: 'D', autonomy: 10, map: 'Tudo', gas_price: 2.50 }
			get '/shortest_path', params

			expect(response['success']).to be(true)
			expect(response['path']).to eq('A B D ')
			expect(response['cost']).to eq(6.25)
		end

		let(:expected_message) { 'Não é possivel calcular o caminho escolhido' }
		it 'to C from B' do
			params = { from: 'C', to: 'B', autonomy: 10, map: 'Tudo', gas_price: 2.50 }
			get '/shortest_path', params

			expect(response['success']).to be(false)
			expect(response['message']).to eq(expected_message)
		end

		it 'try unknown map' do
			params = { from: 'A', to: 'D', autonomy: 10, map: 'Nada', gas_price: 2.50 }
			get '/shortest_path', params

			expect(response['success']).to be(false)
			expect(response['message']).to eq(expected_message)
		end
	end

	private

	def response
		JSON.parse(last_response.body)
	end
end