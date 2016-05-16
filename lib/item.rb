require 'bigdecimal'

class Item
  attr_reader :code, :price
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = BigDecimal.new(price)
  end
end
