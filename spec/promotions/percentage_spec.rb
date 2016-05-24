require_relative '../../lib/promotions/percentage.rb'

describe Percentage do
  subject(:percentage) { described_class.new({minimum_spend: BigDecimal("60"),
                                              percentage: 10})}
  describe '#apply'  do
    it 'returns the amount discounted when the order is valid' do
      expect(percentage.apply(60, { "TEST" => 4 })).to eq(BigDecimal("6"))
    end
    it 'returns no discount when the order is invalid' do
      expect(percentage.apply(40, { "TEST" => 4 })).to eq(0)
    end
  end
end
