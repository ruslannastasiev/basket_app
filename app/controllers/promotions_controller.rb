class PromotionsController < ApplicationController
  before_filter :find_model

  def create
    unless current_cart.code_promotions.exists? @promotion
      current_cart.code_promotions << @promotion
    end

    redirect_to root_path, notice: 'Promotion was successfully added.'
  end

  def destroy
    current_cart.code_promotions.delete @promotion
    redirect_to root_path, notice: 'Promotion was successfully destroyed from cart.'
  end  

  private
  def find_model
    @promotion = CodePromotion.find(params[:id]) if params[:id]
  end
end