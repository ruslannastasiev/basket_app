class CartItemsController < ApplicationController
  before_filter :find_items

  def create
    @cart_item = @cart_items.new(secure_params)

    if @cart_item.save
      redirect_to root_path, notice: 'Item was successfully added to cart.'
    else
      if @cart_item.is_invalid_by_uniq?
        @msg = { notice: 'Count was successfully updated in cart.'}
      else
        @msg = { error: 'Something went wrong'}
      end
      redirect_to root_path, @msg
    end
  end

  def update
    @cart_item = @cart_items.find(params[:id])

    if @cart_item.update(secure_params)
      redirect_to root_path, notice: 'Cart was successfully updated.'
    else
      redirect_to root_path
    end
  end

  def destroy
    @cart_item = @cart_items.find(params[:id])
    @cart_item.destroy

    redirect_to root_path, notice: 'Item was successfully destroyed. from cart.'
  end

  private

  def secure_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

  def find_items
    @cart_items = current_cart.cart_items
  end
  

  # private
  # def find_model
  #   @model = CartItems.find(params[:id]) if params[:id]
  # end
end