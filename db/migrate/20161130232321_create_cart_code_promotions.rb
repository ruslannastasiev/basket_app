class CreateCartCodePromotions < ActiveRecord::Migration
  def change
    create_table :cart_code_promotions do |t|
      t.integer :cart_id
      t.integer :promotion_id

      t.timestamps null: false
    end
  end
end
