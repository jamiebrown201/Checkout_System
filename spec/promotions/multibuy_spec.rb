require_relative '../../lib/promotions/multibuy'

describe MultiBuy do
  subject(:multi_buy) { described_class.new("TEST", 0.75, 3) }

  describe '#apply' do
    it 'is expected to apply the discount on orders which contain more than the number of items' do
      expect(multi_buy.apply(10, { "TEST" => 4 })).to eq 3
    end

    it 'is expected to apply no discount on orders which contain less than the number of items' do
      expect(multi_buy.apply(10, { "TEST" => 2 })).to eq 0
    end
  end
end
