class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id,      null: false
      t.string  :name,          null: false
      t.text    :introductio,   null: false
      t.integer :price,         null: false
      t.boolean :is_sale,       default: false
      t.timestamps              null: false
    end
  end
end
