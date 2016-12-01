class Customer < ActiveRecord::Base
  validates :name, :email, :address, :card_number, :card_month, :card_year, :card_cvv, presence: true
end
