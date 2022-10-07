class OrdersController < ApplicationController
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = current_user.orders.build
  end

  def correct_user
    @order = current_user.orders.find_by(id: params[:id])
    redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    @order[:orderstatus] = Date.today
    @order.save
    flash[:msg] = "Order Delivered"
    redirect_to orders_path
  end

  def create
    # @order = Order.new(order_params)
    @order = current_user.orders.build(order_params)
    @order.date = Time.now
    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:date)
  end
  
end
