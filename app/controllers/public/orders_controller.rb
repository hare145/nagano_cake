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
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.full_name = current_customer.first_name + current_customer.last_name
      session[:order] = @order
    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.full_name = @address.addressee
      session[:order] = @order
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
      session[:order] = @order
    else
      redirect_to orders_new_path
    end
  end

  def complete
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    @order.payment_method = session[:order]
    @order.postal_code = session[:order]
    @order.address = session[:order]
    @order.full_name = session[:order]
    @order.postage = 800
    @order_detail = OrderDetail.new(order_detail_params)
    @order_detai.order_id = @order.id
    @order_detai.item_id
    @order_detai.amount
    @order
  end
  
  
  
  
  private
  
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :full_name)
  end
  
  def orders_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :full_name, :invoice_amount, :postage)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price)
  end
  
end
