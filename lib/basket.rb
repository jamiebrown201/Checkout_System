require 'bigdecimal'

class Basket
  def initialize(product_list, promotions)
    @product_list = product_list

  end

  def calculate_total(current_order)
    prices = get_prices(product_list)
    
    array_of_prices(prices, current_order).reduce(:+) # "own method" love from sandi metz
  end



  # private
  attr_reader :product_list

  def array_of_prices(prices, current_order)
    current_order.map{|key, value| prices[key] * value}
  end

  def get_prices(product_list)
    product_list.each_with_object(Hash.new) do |product, hash|
      hash[product.code] = product.price
    end
  end
end
