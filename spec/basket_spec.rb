require_relative '../lib/basket'

describe Basket do
  let(:item) { double :Item, code: "001", price: BigDecimal("2.50") }
  let(:current_order) { {"001" => 2} }
  let(:items) {[item]}
  subject(:basket){ described_class.new(items, []) }
  describe '#calculate_total' do
    it 'returns the total' do
      expect(basket.calculate_total(current_order)).to eq(BigDecimal("5"))
    end
  end
end
