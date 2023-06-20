class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    if params[:order][:select_address] = 0
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.full_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] = 1
      @order = Order.new(order_params)
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.full_name = @address.addressee 
    elsif params[:order][:select_address_id] = 2
      @order = Order.new(order_params)
    else
      redirect_to orders_new_path
    end
  end

  def complete
    
  end
  
  
  
  
  private
  
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :full_name)
  end
  
end
