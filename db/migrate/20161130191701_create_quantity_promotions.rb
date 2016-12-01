class CreateQuantityPromotions < ActiveRecord::Migration
  def change
    create_table :quantity_promotions do |t|
      t.integer :quantity
      t.integer :item_id
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
