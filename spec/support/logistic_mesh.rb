require_relative '../../app/helpers/logistic_mesh_helper.rb'

# support/logistic_mesh.rb
# logistic meshs fixtures
module LogisticMesh
  private

  def test_sample
    ['A B 10', 'B D 15', 'A C 20', 'C D 30', 'B E 50', 'D E 30']
  end

  def translated_test_sample
  	LogisticMeshHelper.translate test_sample
  end
end
