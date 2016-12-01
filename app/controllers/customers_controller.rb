class CustomersController < ApplicationController

  def create
    @customer = Customer.new(customer_params)
    @cart = current_cart
    if @customer.save
      @cart.customer = @customer
      @cart.save!
      redirect_to root_path, notice: 'Customer was successfully added'
    else
      redirect_to root_path, notice: @customer.errors.full_messages.join(', ') 
    end 
  end  

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :address, :card_number, :card_month, :card_year, :card_cvv)
  end
end