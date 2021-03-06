require 'spec_helper'
require_relative '../support/logistic_mesh.rb'

describe Point do
	include LogisticMesh

	context '.new_points' do
    before(:all) do
      Point.new_points(translated_test_sample, 'Tudo')
    end

    it 'new points' do
      expect(Point.find_by(name: 'A')).to_not be_nil
      expect(Point.find_by(name: 'B')).to_not be_nil
      expect(Point.find_by(name: 'C')).to_not be_nil
    end

    context 'point A rels' do
	    subject(:rels) do
	    	rels = Point.find_by(name: 'A').rels(dir: :outgoing, type: :route)
	    	rels.sort { |x, y| x.end_node.name <=> y.end_node.name }
	    end

	    it 'amount' do
	    	expect(rels.count).to eq(2)
	    end

	    it 'from one point to another' do
	    	expect(rels.first.end_node.name).to eq('B')
	    	expect(rels.last.end_node.name).to eq('C')
	    end

	    it 'relation has the right distance' do
	    	first = rels.first
	    	expect(first[:distance]).to eq(10.0)

	    	last = rels.last
	    	expect(last[:distance]).to eq(20.0)
	    end
    end
	end

	context '.shortest_path' do
    it 'from a to e' do
    	response = Point.shortest_path('A', 'E', 'Tudo').first
    	expect(response[:shortest_path]).to eq('A B D E ')
    	expect(response[:total_distance]).to eq(55.0)
    end
	end
end