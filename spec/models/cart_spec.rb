require "rails_helper"

RSpec.describe Cart, :type => :model do
  it "show correct total price" do
    cart = Cart.create
    item1 = Item.create(name: 'Nexus', price: 350)
    cart_item = cart.cart_items.create(item: item1, quantity: 3)

    expect(cart.sub_total).to eq(1050)
    expect(cart.discount).to eq(0)
    expect(cart.total_price).to eq(1050) 
  end

  it "show correct total price with quantity promotions" do
    item1 = Item.create(name: 'Nexus', price: 350)
    cart = Cart.create
    QuantityPromotion.create(item: item1, quantity: 2, value: 600, name: "2 nexuses for 600")
    cart_item = cart.cart_items.create(item: item1, quantity: 3)
    expect(cart.discount).to eq(0)
    # 2 nexus for 600 and 1 for 350
    expect(cart.total_price).to eq(950)
  end

  it "show correct total price with code promotions" do
    item1 = Item.create(name: 'Nexus', price: 250)
    cart = Cart.create
    cart_item = cart.cart_items.create(item: item1, quantity: 4)
    promo = CodePromotion.create(name: "5% OFF", code_type: :percent, value: 5)
    cart.code_promotions << promo
    cart.calculate_prices

    expect(cart.sub_total).to eq(1000)
    expect(cart.discount).to eq(50)
    expect(cart.total_price).to eq(950)
  end

  it "show correct total price with code promotions and one of them is main" do
    item1 = Item.create(name: 'Nexus', price: 250)
    cart = Cart.create
    cart_item = cart.cart_items.create(item: item1, quantity: 4)
    promo = CodePromotion.create([{name: "20% OFF", code_type: :percent, value: 20, main: true},
                      {name: "5% OFF", code_type: :percent, value: 5},
                      {name: "20 pounds", code_type: :minus, value: 20}])

    cart.code_promotions << promo
    cart.calculate_prices

    expect(cart.sub_total).to eq(1000)
    expect(cart.discount).to eq(200)
    expect(cart.total_price).to eq(800)
  end

  it "show correct total price with code promotions and adding them" do
    item1 = Item.create(name: 'Nexus', price: 250)
    cart = Cart.create
    cart_item = cart.cart_items.create(item: item1, quantity: 4)
    promo = CodePromotion.create([{name: "5% OFF", code_type: :percent, value: 5},
                                  {name: "20 pounds", code_type: :minus, value: 20}])

    cart.code_promotions << promo
    cart.calculate_prices

    expect(cart.sub_total).to eq(1000)
    expect(cart.discount).to eq(70)
    expect(cart.total_price).to eq(930)
  end
end