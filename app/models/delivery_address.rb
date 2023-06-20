class DeliveryAddress < ApplicationRecord
  
  belongs_to :customer
  
  def address_display
   '〒' + postal_code + ' ' + address + ' ' + addressee
  end
  
end
