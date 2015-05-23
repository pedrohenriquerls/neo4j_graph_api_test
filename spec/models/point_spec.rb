require 'spec_helper'

describe Point do
	subject(:logistic_mesh) do
		['A B 10', 'B D 15', 'A C 20', 'C D 30', 'B E 50', 'D E 30']
	end

	context '.translate' do
		let(:translated_mesh) { Point.translate logistic_mesh }
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