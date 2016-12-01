# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


item1 = Item.create( name: "Smart Hub", price: 49.99 )
item2 = Item.create( name: "Motion Sensor", price: 24.99 )
item3 = Item.create( name: "Wireless Camera", price: 99.99 )
item4 = Item.create( name: "Smoke Sensor", price: 19.99 )
item5 = Item.create( name: "Water Leak Sensor", price: 14.99 )

CodePromotion.create([{name: "20% OFF", code_type: :percent, value: 20, main: true},
                      {name: "5% OFF", code_type: :percent, value: 5},
                      {name: "20 pounds", code_type: :minus, value: 20}])

QuantityPromotion.create([{name: "3 Motion sensors for £65.00", value: 65, item: item2, quantity: 3},
                          {name: "2 Smoke sensors for £35.00", value: 35, item: item4, quantity: 2}])

