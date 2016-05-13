require_relative '../lib/checkout'

describe Checkout do
  subject(:checkout) { described_class.new() }
  describe '#initialize' do
    it 'initializes with the skeleleton to test the full stack and test suite is woring' do
      expect(checkout.skeleleton).to eq "working"
    end
  end
end
