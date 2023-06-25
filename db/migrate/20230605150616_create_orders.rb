class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,        null: false
      t.string  :postal_code,        null: false
      t.string  :address,            null: false
      t.string  :full_name,          null: false
      t.integer :payment,            null: false
      t.integer :order_status,      null: false
      t.integer :invoice_amount,     null: false
      t.integer :postage,            null: false
      t.timestamps                   null: false
    end
  end
end
