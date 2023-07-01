class Order < ApplicationRecord
  
  belongs_to :customer
  
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum order_status_method: { wait: 0 , confirm: 1, production: 2, preparing: 3, delivered: 4 }
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    with_tax_price * amount
  end
  
end
