class CreateCart < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
