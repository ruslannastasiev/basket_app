class CreateCodePromotions < ActiveRecord::Migration
  def change
    create_table :code_promotions do |t|
      t.integer :value
      t.string :name
      t.integer :code_type
      t.boolean :main, default: false

      t.timestamps null: false
    end
  end
end
