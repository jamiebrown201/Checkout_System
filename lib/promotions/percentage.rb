class Percentage
  def initialize(args)
    @minimum_spend = args[:minimum_spend]
    @percentage = args[:percentage]
  end

  def apply(current_total, current_order)
    is_the_order_eligable?(current_total) ? apply_discount(current_total) : 0
  end

  private

  attr_reader :minimum_spend, :percentage

  def is_the_order_eligable?(current_total)
    current_total >= minimum_spend
  end

  def apply_discount(current_total)
    current_total * percentage / 100
  end
end
