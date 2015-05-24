require_relative '../support/logistic_mesh.rb'
require_relative '../../app/helpers/logistic_mesh_helper.rb'

describe LogisticMeshHelper do
	include LogisticMesh

	context '.translate' do
		let(:translated_mesh) { LogisticMeshHelper.translate test_sample }
		it 'first mesh' do
			mesh = translated_mesh.first

			expect(mesh[:from]).to eq('A')
			expect(mesh[:to]).to eq('B')
			expect(mesh[:distance]).to eq(10.0)
		end

		it 'last mesh' do
			mesh = translated_mesh.last

			expect(mesh[:from]).to eq('D')
			expect(mesh[:to]).to eq('E')
			expect(mesh[:distance]).to eq(30.0)
		end
	end
end