require_relative '../lib/basket'

describe Basket do
  let(:item) {double :Item, code: '001', price: "10.99"}
  let(:product_list) {[item]}
  subject(:basket) { described_class.new(product_list) }
  describe '#get_prices' do
    it 'returns a hash with the key as the item code and value as the price' do
      expect(basket.get_prices(product_list)).to eq({"001" => "10.99"})
    end
  end
end
