require_relative '../lib/basket'


describe Basket do
  let(:item) {double :Item, code: '001', price: BigDecimal("10.99")}
  let(:product_list) {[item]}
  let(:current_order) {{'001' => 2}}
  subject(:basket) { described_class.new(product_list) }
  describe '#calculate_total' do
    it 'creates a array of each item price times its quantity' do
      expect(basket.calculate_total(current_order)).to eq(item.price * 2)
    end
  end
end
