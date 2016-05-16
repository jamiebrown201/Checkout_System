require_relative '../lib/item'

describe Item do
  subject(:item) { described_class.new(001, "Travel Card Holder", "9.99") }

  describe '#code' do
    it 'is expected to return the code of the item' do
      expect(item.code).to eq 001
    end
  end

  describe '#price' do
    it 'is expected to return the price of the item' do
      expect(item.price).to eq 9.99
    end
  end

end
