class Basket
  def initialize(inventory, promotions)
    @inventory = inventory
    @promotions = promotions
  end

  def calculate_total(current_order)
    total_after_discount(total_before_discount(current_order, item_prices), current_order)
  end

  private

  attr_reader :inventory, :promotions

  def total_before_discount(current_order, item_prices)
    current_order.map {|key, value| item_prices[key] * value }.reduce(:+)
  end

  def total_after_discount(total_before_discount, current_order)
    promotions.reduce(total_before_discount) do |current_total, promotion|
      current_total - promotion.apply(current_total, current_order)
    end
  end

  def item_prices
    inventory.each_with_object(Hash.new) do |item, hash|
      hash[item.code] = item.price
    end
  end
end
