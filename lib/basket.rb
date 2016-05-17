require 'bigdecimal'

class Basket
  def initialize(product_list, promotions=[])
    @product_list = product_list
    @promotions = promotions
  end

  def calculate_total(current_order)
    prices = get_prices(product_list)
    array_of_prices = array_of_prices(prices, current_order)
    total_after_discount(total_before_discount(array_of_prices), current_order)
  end

  private
  attr_reader :product_list, :promotions

  def total_before_discount(array_of_prices)
    array_of_prices.reduce(:+)
  end

  def total_after_discount(total_before_discount, current_order)
    promotions.reduce(total_before_discount) do |current_total, promotion|
      current_total - promotion.apply(current_total, current_order)
    end
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
