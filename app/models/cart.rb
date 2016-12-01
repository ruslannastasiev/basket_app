class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :cart_code_promotions, dependent: :destroy, autosave: false
  has_many :code_promotions, through: :cart_code_promotions, dependent: :destroy
  # validates :total_price, :sub_total, :discount
  belongs_to :customer

  def calculate_prices
    self.sub_total = cart_items.sum(:total_price)
    self.discount = calculate_discount
    self.total_price = sub_total.zero? ? 0 : sub_total - discount
    self.save
  end

  def approve
    self.approved = true
    self.save
  end

  private

  def calculate_discount
    if main_promotion = code_promotions.find_by_main(true)
      main_promotion.calculate_discount(self.sub_total)
    else
      code_promotions.inject(0){|sum, promo| sum + promo.calculate_discount(self.sub_total)}
    end
  end
end