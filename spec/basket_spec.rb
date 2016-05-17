require_relative '../lib/basket'


describe Basket do
  let(:item) {double :Item, code: '001', price: BigDecimal("10.99")}
  let(:product_list) {[item]}
  let(:current_order) {{'001' => 2}}
  subject(:basket) { described_class.new(product_list) }
  describe '#get_prices' do
    it 'returns a hash with the key as the item code and value as the price' do
      expect(basket.get_prices(product_list)).to eq({"001" => item.price})
    end
  end
  describe '#calculate_total' do
    it 'creates a array of each item price times its quantity' do
      expect(basket.calculate_total(current_order)).to eq(item.price * 2)
    end
  end
  # describe '#add_total' do
  #   expect(basket.add_total(price_array).to eq
  # end
end
