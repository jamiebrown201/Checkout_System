require 'bigdecimal'

class Basket
  def initialize(product_list)
    @product_list = product_list
  end

  def calculate_total(current_order)
    prices = get_prices(product_list)
  end

  # private
  attr_reader :product_list

  def get_prices(product_list)
    product_list.each_with_object(Hash.new) do |product, hash|
      hash[product.code] = product.price
    end
  end
end
