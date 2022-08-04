class CreateAddressbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :addressbooks do |t|
      t.references :order,      foreign_key: true
      t.string :post_code,      null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :banti,          null: false
      t.string :bilding_name
      t.string :phone_num,      null: false

      t.timestamps
    end
  end
end
