class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    with_tax_price * amount
  end
  
end
