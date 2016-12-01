class CartItem < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  MESSAGE = "duplicate_in_cart"

  belongs_to :item
  belongs_to :cart

  validates :item, uniqueness: { scope: :cart, :message => MESSAGE }
  validates :item, :cart, presence: true
  before_save :calculate_prices
  after_save { cart.calculate_prices }
  after_destroy { cart.calculate_prices }

  after_rollback(on: :create) do
    if is_invalid_by_uniq? # check if there is only one error message and this message == MESSAGE      
      cart_item = self.class.find_by_item_id_and_cart_id(item_id, cart_id)
      cart_item.quantity += quantity
      cart_item.save
    end
  end

  def is_invalid_by_uniq?
    errors.messages.values.flatten.first == MESSAGE
  end

  def item_discount
    item_price * quantity - total_price
  end

  def discounted?
    item_discount.zero?
  end

  private

  def calculate_prices
    self.item_price = item.price
    self.total_price = item_price * quantity
    check_quantity_promotion
  end

  def check_quantity_promotion
    promotion = item.quantity_promotion
    count = promotion ? self.quantity / promotion.quantity : 0
    count.times do
      old_total_price = promotion.quantity * self.item_price
      self.total_price = self.total_price - old_total_price + promotion.value
    end
  end
end
