require 'bigdecimal'
require_relative 'basket'

class Checkout

  def initialize(args)
    @inventory = args[:inventory]
    @current_order = Hash.new(0)
    @basket_klass = args[:basket_klass].new(args[:inventory], args[:promotions])
  end

  def scan(item_code)
    fail "Sorry #{item_code} is an invalid item code" unless item_in_inventory?(item_code)
    current_order[item_code] += 1
  end

  def total
    display(basket_klass.calculate_total(current_order))
  end

  private

  attr_reader :inventory, :current_order, :basket_klass

  def item_in_inventory?(item_code)
    inventory.map{ |product| product.code }.include?(item_code)
  end

  def display(unformatted)
    '£%.2f' % unformatted.round(2)
  end
end
