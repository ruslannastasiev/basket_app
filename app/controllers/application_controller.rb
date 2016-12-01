class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  rescue_from ActiveRecord::RecordNotFound, with: :create_cart

  private

  def current_cart
    @cart = if session[:cart_id]
              Cart.find(session[:cart_id])
            else
              create_cart
            end
  end

  def create_cart
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
