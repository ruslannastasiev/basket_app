class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :card_number, limit: 8
      t.integer :card_month
      t.integer :card_year
      t.integer :card_cvv

      t.timestamps null: false
    end
  end
end
