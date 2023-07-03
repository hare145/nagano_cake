class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @order = current_customer.orders
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @orderdetails = OrderDetail.where(order_id: @order)
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
    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.full_name = @address.addressee
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    else
      redirect_to orders_new_path
    end
  end

  def create
    @order = Order.new(orders_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new(order_id: @order.id)
        @order_detail.item_id = cart_item.item.id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.price
        @order_detail.product_status = 0
        @order_detail.save
      end
      @cart_items.destroy_all
    end  
    redirect_to orders_complete_path
  end
  
  def complete
  end
  
  
  
  private
  
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :full_name)
  end
  
  def orders_params
    params.require(:order).permit(:customer_id, :payment, :postal_code, :address, :full_name, :invoice_amount, :postage, :order_status)
  end
  
end
