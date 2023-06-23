class OrderDetail < ApplicationRecord
  
  belongs_to :order
  
  belongs_to :item
  
  enum product_status_method: { impossible: 0, pending: 1, production: 2, complete: 3 }

end
