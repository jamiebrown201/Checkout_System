class MultiBuy
  def initialize(product, discount, minimum_items)
    @product = product
    @discount = discount
    @minimum_items = minimum_items
  end

  def apply(current_total, current_order)
    is_order_eligible?(current_order) ? apply_promotion(current_order) : 0
  end

  private

  attr_reader :minimum_items, :discount, :product

  def apply_promotion(current_order)
    current_order[product] * discount
  end

  def is_order_eligible?(current_order)
    current_order[product] >= minimum_items
  end
end
