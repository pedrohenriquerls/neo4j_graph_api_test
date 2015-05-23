require_relative 'app_base.rb'

# app.rb
# logistic api core
class App < AppBase
  get '/' do
    'blastoise'
  end
end
