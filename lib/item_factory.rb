require 'ostruct'
require 'bigdecimal'
require_relative 'item_config/items'

module ItemFactory
  def self.build(config)
    OpenStruct.new(
    code: config[0],
    name: config[1],
    price: config[2]
    )
  end
end
