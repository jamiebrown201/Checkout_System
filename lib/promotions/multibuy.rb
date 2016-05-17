class MultiBuy
  def initialize(item_code, minimum_items, discount)
    @item_code = item_code
    @minimum_items = minimum_items
    @discount = discount
  end

  def apply(current_total, current_order)
    is_order_eligible?(current_order) ? apply_promotion(current_order) : 0
  end

  private

  attr_reader :item_code, :minimum_items, :discount

  def apply_promotion(current_order)
    current_order[item_code] * discount
  end

  def is_order_eligible?(current_order)
    current_order[item_code] >= minimum_items
  end
end
