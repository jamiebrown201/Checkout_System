require_relative '../../lib/checkout'
require_relative '../../lib/item_factory'
require_relative '../../lib/basket'
require_relative '../../lib/promotions/percentage'
require_relative '../../lib/promotions/multibuy'

describe 'integration spec' do
  let(:inventory) do
    [
      ItemFactory.build(ItemConfig.travel_card_holder),
      ItemFactory.build(ItemConfig.personalised_cufflinks),
      ItemFactory.build(ItemConfig.kids_tee)
    ]
  end
  let(:ten_percent_discount) { Percentage.new({minimum_spend: BigDecimal("60"),
                                               percentage: 10}) }
  let(:travel_card_discount) { Multibuy.new({item_code: "001",
                                             minimum_quantity: 2,
                                             discount: BigDecimal("0.75")}) }
  let(:promotions) { [travel_card_discount, ten_percent_discount] }
  subject(:checkout) { Checkout.new({inventory: inventory,
                                     basket_klass: Basket,
                                     promotions: promotions}) }

  it 'applies a 10% discount when the order is over £60' do
    checkout.scan("001")
    checkout.scan("002")
    checkout.scan("003")
    expect(checkout.total).to eq('£66.78')
  end

  it 'applies a multibuy discount' do
    checkout.scan('001')
    checkout.scan('003')
    checkout.scan('001')
    expect(checkout.total).to eq('£36.95')
  end

  it 'applies both discounts' do
    checkout.scan('001')
    checkout.scan('002')
    checkout.scan('001')
    checkout.scan('003')
    expect(checkout.total).to eq('£73.76')
  end
end
