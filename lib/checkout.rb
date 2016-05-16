require 'bigdecimal'
require_relative 'basket'

class Checkout
  def initialize(inventory)
    @inventory = inventory
  end

  def scan(item_code)
    fail "Cannot find a product with #{item_code} in the product list"
  end
end
