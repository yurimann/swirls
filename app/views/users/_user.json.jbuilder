json.extract! user, :id, :first_name, :last_name, :apartment_number, :street, :city, :postal_code, :phone, :delivery_apartment_number, :created_at, :updated_at
json.url user_url(user, format: :json)
