class Admin::OrderCustomersController < ApplicationController
  def show
    @order_customer = Order.find_by(customer_id: params[:id])
    @order = Order.where(customer: params[:id]).page(params[:page]).per(10)
  end
end
