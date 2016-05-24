require_relative '../../lib/promotions/multibuy.rb'

describe Multibuy do
  subject(:multibuy) { described_class.new({item_code: "TEST",
                                            minimum_quantity: 3,
                                            discount: BigDecimal("0.75")})}
  describe '#apply'  do
    it 'returns the amount discounted when the order is valid' do
      expect(multibuy.apply(60, { "TEST" => 4 })).to eq(BigDecimal("3"))
    end
    it 'returns no discount when the order is invalid' do
      expect(multibuy.apply(40, { "TEST" => 2 })).to eq(0)
    end
  end
end
