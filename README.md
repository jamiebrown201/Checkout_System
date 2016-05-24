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
require_relative '../../lib/item_factory'

#Then you will need to require any promotions (if any) that you will want to
#potentially use. Below I have loaded both of the current available ones.

require_relative '../../lib/promotions/percentage'
require_relative '../../lib/promotions/multibuy'

# Then you will need to create your items that your checkout will recognise.
# You can create items easily using the Item factory. Inputting an array with
# the code first, name second and price as a BigDecimal third.

travel_card_holder = ItemFactory.build(["001", "Travel Card Holder", BigDecimal("9.25")]),

#I have already loaded the three items for this exercise in a config module
#for ease of use.

item_001 = ItemFactory.build(ItemConfig.travel_card_holder),
item_002 = ItemFactory.build(ItemConfig.personalised_cufflinks),
item_003 = ItemFactory.build(ItemConfig.kids_tee)

#Then you will need to input them into an array so that it can be passed to
#the Checkout object.

products = [item_001, item_002, item_003]
#Then you will need to create your discounts. Percentage currently takes two
#arguments as a hash, the percentage and then the minimum price.

ten_percent_discount = Percentage.new({minimum_spend: BigDecimal("60"),
                                       percentage:    10})

#MultiBuy discount takes three arguments as a hash the item code, the minimum quantity
#and the discount.

travel_card_discount = Multibuy.new({item_code:        "001",
                                     minimum_quantity: 2,
                                     discount:         BigDecimal("0.75")})

#Then you need to input the percentages into an array in the order you
#want the discounts to be applied.

promotions = [travel_card_discount, ten_percent_discount]

#Then you can create the checkout object which will act as an interface for
#you to scan and total up orders. The checkout object takes three arguments
#as a hash the products array we created earlier, the "Basket" object and the
#promotions array.

checkout = Checkout.new({inventory: inventory,
                         basket_klass: Basket,
                         promotions: promotions})

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
As this is just a simple command line app there are elements that can be improved. Most notably using a database for the products as creating them as objects and loading them in each time is very artificial.
