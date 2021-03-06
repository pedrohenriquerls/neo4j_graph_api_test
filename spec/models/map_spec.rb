require 'spec_helper'
require_relative '../../app/models/point.rb'
require_relative '../support/logistic_mesh.rb'

describe Map do
	include LogisticMesh

	before(:all) do
		name = 'Tudo'
		Point.new_points(translated_test_sample, name)
		Map.find_or_create_by(name: name)
	end

	it 'new maps' do
		expect(Map.find_by(name: 'Tudo')).to_not be_nil
	end

	context '#add_new_points' do
		before(:all) do
			map = Map.find_by(name: 'Tudo')
			map.add_new_points(Point.all)
		end

		it 'have all points' do
    	map = Map.find_by(name: 'Tudo')
    	expect(map.points.count).to eq(5)
		end
	end
end