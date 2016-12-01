class CartCodePromotion < ActiveRecord::Base
  belongs_to :code_promotion, foreign_key: :promotion_id, class_name: 'CodePromotion'
  belongs_to :cart
  validates :code_promotion, :cart, presence: true

  validates :code_promotion, uniqueness: { scope: :cart }

  after_save { cart.calculate_prices }
  after_destroy { cart.calculate_prices }
end