class Order < ApplicationRecord
  has_many :products_orders
  has_many :products, through: :products_orders
  
end
