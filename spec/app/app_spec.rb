require_relative '../spec_helper'

describe 'My Sinatra Application' do
  it 'should allow accessing the home page' do
    get '/'
    puts 'teste'
    last_response.should be_ok
  end
end