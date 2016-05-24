class Multibuy
  def initialize(args)
    @item_code = args[:item_code]
    @minimum_quantity = args[:minimum_quantity]
    @discount = args[:discount]
  end

  def apply(current_total, current_order)
    is_the_order_eligable?(current_order) ? apply_discount(current_order) : 0
  end

  private

  attr_reader :item_code, :minimum_quantity, :discount

  def is_the_order_eligable?(current_order)
    current_order[item_code] >= minimum_quantity
  end

  def apply_discount(current_order)
    current_order[item_code] * discount
  end
end
