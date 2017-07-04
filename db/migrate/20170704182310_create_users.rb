class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :apartment_number
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :phone
      t.string :delivery_apartment_number
      t.string :delivery_street
      t.string :delivery_city
      t.string :delivery_postal_code
      t.string :delivery_contact
      t.string :delivery_phone
      t.text :notes
      t.timestamps
    end
  end
end
