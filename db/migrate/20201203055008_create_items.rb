class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                   forign_key: true
      t.string :item_name,                  null: false
      t.text :explanation,                  null: false
      t.integer :price,                     null: false
      t.integer :category_address_id,       null: false
      t.integer :atatus_address_id,         null: false
      t.integer :delivery_fee_address_id,   null: false
      t.integer :from_area_address_id,      null: false
      t.integer :delivery_days_address_id,  null: false
      t.timestamps
    end
  end
end
