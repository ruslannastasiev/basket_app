class CodePromotion < ActiveRecord::Base
  validates :name, :code_type, :value, presence: true
  enum code_type: [:percent, :minus]

  def calculate_discount(subtotal)
    code_type == 'percent' ? subtotal * value / 100 : value
  end
end
