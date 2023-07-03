class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  
  def update
      order_detail = OrderDetail.find_by(order_id: params[:id], item_id: params[:order_detail][:item_id])
      order_detail.update(order_detail_params)
      redirect_to admin_order_path(params[:id])
  end
  
  
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
  
end
