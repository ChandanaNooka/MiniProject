class OrderItemsController < ApplicationController

  def create
    item = MenuItem.find(params[:menu_item_id])
    current_cart = @current_cart
    if current_cart.menu_items.include?(item)
      @order_item = current_cart.order_items.find_by(:menu_item_id => item)
      @order_item.quantity ||= 1
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new
      @order_item.cart = current_cart
      @order_item.menu_item = item
    end

    @order_item.save
    redirect_to cart_path(current_cart)
  end

  def show
  end

  def destroy
  	@order_item = OrderItem.find(params[:id])
  	@order_item.destroy
  	redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity ||= 1
    @order_item.quantity += 1 
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    if @order_item.quantity > 1
      @order_item.quantity ||= 1
      @order_item.quantity -= 1
    end
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def order_item_params
  	params.require(:order_item).permit(:quantity, :menu_item_id, :cart_id, :user_id)
  end

end
