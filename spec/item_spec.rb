require_relative '../lib/item_factory.rb'
require 'config/item_test_config.rb'

describe ItemFactory do
  subject(:item_factory) { described_class.new }
  it 'creates a new open struct object with the correct attributes' do
    testing = ItemFactory.build(ItemConfigTest.test)
    expect(testing.code).to eq("001")
    expect(testing.name).to eq("test")
    expect(testing.price).to eq(BigDecimal("9.25"))
  end

end
