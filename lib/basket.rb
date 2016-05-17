require 'bigdecimal'

class Basket
  def initialize(product_list, promotions=[])
    @product_list = product_list
    @promotions = promotions
  end

  def calculate_total(current_order)
    prices = get_prices(product_list)
    total_before_discount(array_of_prices(prices, current_order)) # "own method" love from sandi metz
  end


  # private
  attr_reader :product_list

  def total_before_discount(array_of_prices)
    array_of_prices.reduce(:+)
  end

  def array_of_prices(prices, current_order)
    current_order.map{|key, value| prices[key] * value}
  end

  def get_prices(product_list)
    product_list.each_with_object(Hash.new) do |product, hash|
      hash[product.code] = product.price
    end
  end
end
