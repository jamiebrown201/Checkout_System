require_relative '../../lib/promotions/percentage'

describe Percentage do
  subject(:percentage) { described_class.new(10, 50) }

  describe '#apply' do
    it 'applies a discount if order total is over a minimum price' do
      expect(percentage.apply(60, 100)).to eq 6
    end

    it 'does not apply the discount if the order is below the minimum price' do
      expect(percentage.apply(40, 100)).to eq 0
    end
  end
end
