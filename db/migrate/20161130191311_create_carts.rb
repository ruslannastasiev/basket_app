class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :sub_total, precision: 8, scale: 2, default: 0
      t.decimal :discount, precision: 8, scale: 2, default: 0
      t.decimal :total_price, precision: 8, scale: 2, default: 0
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
