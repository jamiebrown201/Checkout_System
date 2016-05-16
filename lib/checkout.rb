require 'bigdecimal'
require_relative 'basket'

class Checkout

  def initialize(product_list)
    @product_list = product_list
  end

  def scan(item_code)
    fail "Cannot find a product with #{item_code} in the product list" unless item_in_product_list?(item_code)
    order[item_code] += 1
  end

  private
  attr_reader :product_list

  def item_in_product_list?(item_code)
    product_list.map{ |product| product.code }.include?(item_code)
  end

end
