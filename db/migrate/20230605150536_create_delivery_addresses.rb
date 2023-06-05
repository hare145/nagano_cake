class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer    :customer_id,    null: false
      t.string     :postal_code,    null: false
      t.string     :address,        null: false
      t.string     :addressee,      null: false
      t.timestamps                  null: false
    end
  end
end
