class CartsController < ApplicationController
  before_action :current_cart

  def show
    @items = Item.all
    @cart_items = @cart.cart_items
    @promotions = CodePromotion.all
  end

  def approve
    @cart.approve
    redirect_to root_path, notice: "Cart was succesfully approved."   
  end

  def reset
    session[:cart_id] = nil
    redirect_to root_path
  end
end