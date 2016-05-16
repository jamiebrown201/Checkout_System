require_relative '../lib/checkout'

describe Checkout do

  let(:item) {double :Item, code: '001'}
  let(:products) {[item]}
  subject(:checkout) { described_class.new(products) }

  describe '#scan' do
    it 'is expected to raise an error if given a code that is not valid' do
      expect{ (checkout.scan('011')) }.to raise_error 'Cannot find a product with 011 in the product list'
    end
    it 'is expected to raise an error if given a code that is not valid' do
      expect{ (checkout.scan('011')) }.to raise_error 'Cannot find a product with 011 in the product list'
    end
  end
end
