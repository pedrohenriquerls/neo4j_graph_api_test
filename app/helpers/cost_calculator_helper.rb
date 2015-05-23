# cost_calculator_helper.rb
# calculate the cost of route based on gas price, distance and vehicle autonomy
class CostCalculatorHelper
  def self.calculate(args)
  	return nil unless valid? args
  	gas_price = args[:gas_price].to_f
  	distance = args[:distance].to_f
  	vehicle_autonomy = args[:vehicle_autonomy].to_f

  	distance * (gas_price / vehicle_autonomy)
  end

  def self.valid?(args)
  	number?(args[:gas_price]) &&
  	  number?(args[:distance]) &&
  	  number?(args[:vehicle_autonomy])
  end

  def self.number?(str)
    true if Float(str) rescue false
  end
end
