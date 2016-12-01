class QuantityPromotion < ActiveRecord::Base
  validates :name, :value, :item, presence: true

  belongs_to :item
end
