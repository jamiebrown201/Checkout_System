require_relative '../../lib/checkout'
require_relative '../../lib/item'
require_relative '../../lib/promotions/percentage'
require_relative '../../lib/promotions/multibuy'
describe 'Integration spec' do
  let(:products) do
    [
      Item.new('001','Travel Card Holder', BigDecimal("9.25")),
      Item.new('002','Personalised cufflinks', BigDecimal("45.00")),
      Item.new('003','Kids T-shirt', BigDecimal("19.95"))
    ]
  end

  let(:ten_percent_discount) { Percentage.new(10, BigDecimal("60.00")) }
  let(:travel_card_discount) { MultiBuy.new("001", 2, BigDecimal("0.75")) }
  let(:promotions) { [travel_card_discount, ten_percent_discount] }
  subject(:checkout) { Checkout.new(products, Basket, promotions) }

  it 'applies a 10% discount when order is over £60' do
    checkout.scan '001'
    checkout.scan '002'
    checkout.scan '003'
    expect(checkout.total).to eq '£66.78'
  end

  it 'applies a multibuy discount' do
    checkout.scan '001'
    checkout.scan '003'
    checkout.scan '001'
    expect(checkout.total).to eq '£36.95'
  end

  it 'applies both discounts' do
    checkout.scan '001'
    checkout.scan '002'
    checkout.scan '001'
    checkout.scan '003'
    expect(checkout.total).to eq '£73.76'
  end

end
