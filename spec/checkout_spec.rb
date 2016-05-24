require_relative '../lib/checkout'

describe Checkout do
  let(:item) { double :Item, code: "001" }
  let(:basket) { double :Basket }
  let(:basket_klass) { double :basket_klass, new: basket }
  let(:inventory) {[item]}
  subject(:checkout) { described_class.new({inventory: inventory, basket_klass: basket_klass}) }
  describe '#scan' do
    it 'scanning an item adds it to the current order' do
      checkout.scan("001")
      checkout.scan("001")
      expect(checkout.current_order).to eq({"001" => 2})
    end
    it 'raises an error if you scan an invalid item' do
      expect{(checkout.scan("111"))}.to raise_error("Sorry 111 is an invalid item code")
    end
  end

  describe '#total' do
    it 'is expected to return a formatted string of ' do
      checkout.scan('001')
      checkout.scan('001')
      allow(basket).to receive(:calculate_total).with({'001' => 2}).and_return(BigDecimal("5.00"))
      expect(checkout.total).to eq('£5.00')
    end
  end
end
