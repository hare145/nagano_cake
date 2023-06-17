class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
  
  def update
    @order = Order.new
    @order.update(order_params)
    redirect_to admin_order_path
  end
  
  
  
  
end

