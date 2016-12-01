class AddPricesToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :item_price, :decimal, precision: 8, scale: 2, default: 0
    add_column :cart_items, :total_price, :decimal, precision: 8, scale: 2, default: 0
  end
end
