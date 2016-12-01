require "rails_helper"

RSpec.describe CartItem, :type => :model do
  it "show correct total price" do
    cart = Cart.create
    item1 = Item.create(name: 'Nexus', price: 350)
    cart_item = cart.cart_items.create(item: item1, quantity: 3)

    expect(cart_item.total_price).to eq(1050) 
  end

  it "show correct total price with promotions" do
    item1 = Item.create(name: 'Nexus', price: 350)
    cart = Cart.create
    QuantityPromotion.create(item: item1, quantity: 2, value: 600, name: "2 nexuses for 600")
    cart_item = cart.cart_items.create(item: item1, quantity: 3)
   
    # 2 nexus for 600 and 1 for 350
    expect(cart_item.total_price).to eq(950)
  end
end