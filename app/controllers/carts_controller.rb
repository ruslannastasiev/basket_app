class CartsController < ApplicationController
  before_action :current_cart
  before_filter :find_promotion, only: [:add_code_promotion, :destroy_promotion]

  def show
    @items = Item.all
    @cart_items = @cart.cart_items
    @promotions = CodePromotion.all
  end

  def add_code_promotion
    unless @cart.code_promotions.exists? @promotion
      @cart.code_promotions << @promotion
    end

    redirect_to root_path, notice: 'Promotion was successfully added.'
  end

  def destroy_promotion
    @cart.code_promotions.delete @promotion
    redirect_to root_path, notice: 'Promotion was successfully destroyed from cart.'
  end

  private

  def find_promotion
    @promotion = CodePromotion.find(params[:promotion_id])
  end
end
