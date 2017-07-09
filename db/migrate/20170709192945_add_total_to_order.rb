class AddTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :float
    add_column :orders, :delivery, :float
    add_column :orders, :subtotal, :float
    add_column :orders, :tax, :float
  end
end
