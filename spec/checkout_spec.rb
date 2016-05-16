require_relative '../lib/checkout'

describe Checkout do
  let(:basket) { double :Basket }
  let(:basket_klass) { double :basket_klass, new: basket }
  let(:item) {double :Item, code: '001'}
  let(:product_list) {[item]}
  subject(:checkout) { described_class.new(product_list, basket_klass) }

  describe '#scan' do
    it 'is expected to raise an error if given a code that is not valid' do
      expect{ (checkout.scan('011')) }.to raise_error 'Cannot find a product with 011 in the product list'
    end
    it 'is expected to not raise an error if given a code that is valid' do
      expect{ (checkout.scan('001')) }.to_not raise_error 'Cannot find a product with 001 in the product list'
    end
    it 'adds the item to the current_order hash' do
      checkout.scan('001')
      checkout.scan('001')
      expect(checkout.current_order).to include({"001" => 2})
    end
  end

  describe '#total' do
    it 'is expected to return the total of basket' do
      checkout.scan('001')
      checkout.scan('001')
      allow(basket).to receive(:total).with({'001' => 2}).and_return(1000)
      expect(checkout.total).to eq "£10.00"
    end
  end
end
