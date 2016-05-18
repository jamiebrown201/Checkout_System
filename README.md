# Check Out Tech Test
A simple checkout system that can also handle promotions. The system is command line based. The purpose of creating this system was for a tech test. Predominantly I wanted to demonstrate my OOP and TDD skills.

#Installation
Make sure your computer has [Ruby](https://www.ruby-lang.org/en/) installed by running `ruby --version` if you get an error you will need to [download](https://www.ruby-lang.org/en/downloads/) and install ruby.

Clone and download the repo to your local machine and run bundle(if you don't have bundler installed you will need to run `gem install bundler`)

```
git clone git@github.com:jamiebrown201/check-out.git
cd check-out
bundle install
```
#Running the system
The program is a command line app and can by used in a REPL such as irb. Run irb in your command line and use the following commands.
```ruby
irb
#Firstly you need to require all the ruby files that make up the system.

require_relative '../../lib/checkout'
require_relative '../../lib/item'

#Then you will need to require any promotions (if any) that you will want to
#potentially use. Below I have loaded both of the current available ones.

require_relative '../../lib/promotions/percentage'
require_relative '../../lib/promotions/multibuy'

# Then you will need to create your items that your checkout will recognise.
#Each item is a ruby object that takes three arguments. The first being the
#item code, the second being its name and the third is the price inputted as
#a ruby big decimal.

item_001 = Item.new('001','Travel Card Holder', BigDecimal("9.25")),
item_002 = Item.new('002','Personalised cufflinks', BigDecimal("45.00")),
item_003 = Item.new('003','Kids T-shirt', BigDecimal("19.95"))

#Then you will need to input them into an array so that it can be passed to
#the Checkout object.

products = [item_001, item_002, item_003]
#Then you will need to create your discounts. Percentage currently takes two
#arguments the percentage and then the minimum price

ten_percent_discount = Percentage.new(10, BigDecimal("60.00"))

#MultiBuy discount takes three arguments the item code, the minimum quantity
#and the discount

travel_card_discount = MultiBuy.new("001", 2, BigDecimal("0.75"))

#Then you need to input the percentages into an array in the order you
#want the discounts to be applied.

promotions = [travel_card_discount, ten_percent_discount]

#Then you can create the checkout object which will act as an interface for
#you to scan and total up orders. The checkout object takes three arguments
#the products array we created earlier, the "Basket" object and the promotions
#array.

checkout = Checkout.new(products, Basket, promotions)
#With the checkout all set up you can now scan the items like so.

checkout.scan('001')
checkout.scan('002')
checkout.scan('003')

#Then to total up your current order and return a formatted price call.

checkout.total

```
#Tests
To run the tests just run `rspec` in the root directory.

#Future improvements
As this is just a simple command line app there are elements that can be improved. Most notably using a database for the products as creating them as objects and loading them in each time is not efficient.
