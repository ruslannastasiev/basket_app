class Item < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :price, presence: true
  has_one :quantity_promotion
end
