class Percentage
  def initialize(percentage, minimum_price)
    @percentage = percentage
    @minimum_price = minimum_price
  end

  def apply(current_total)
    is_order_eligible?(current_total) ? apply_promotion(current_total) : 0
  end

  private

  attr_reader :minimum_price, :percentage

  def is_order_eligible?(current_total)
    current_total > minimum_price
  end

  def apply_promotion(current_total)
    current_total - (current_total / percentage)
  end
end
