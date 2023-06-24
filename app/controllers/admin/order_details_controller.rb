class Admin::OrderDetailsController < ApplicationController
  
  def update
    if OrderDetail.find_by(order_id: params[:id]).present?
      order_detail = OrderDetail.find_by(item_id: params[:order_detail][:item_id])
      order_detail.update(order_detail_params)
      redirect_to admin_order_path(params[:id])
    end
  end
  
  
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
  
end
