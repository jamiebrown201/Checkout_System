require 'bigdecimal'
require_relative 'basket'

class Checkout
  attr_reader :product_list
  attr_accessor :current_order

  def initialize(product_list, basket_Klass)
    @product_list = product_list
    @current_order = Hash.new(0)
  end

  def scan(item_code)
    fail "Cannot find a product with #{item_code} in the product list" unless item_in_product_list?(item_code)
    current_order[item_code] += 1
  end


  private

  def item_in_product_list?(item_code)
    product_list.map{ |product| product.code }.include?(item_code)
  end


end
