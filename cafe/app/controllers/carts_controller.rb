class CartsController < ApplicationController
  
  def show
    @order_items = OrderItem.all
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  
end
