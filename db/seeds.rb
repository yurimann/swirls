# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Order.destroy_all

10.times do
  Product.create(
    name: Faker::Food.ingredient,
    price: 2.49
    )
end

5.times do
  Order.create(
    date: Faker::Date.forward(23)
  )
  5.times do
    ProductsOrder.create(
    product_id: rand(1..10),
    order_id: rand(1..5),
    quantity: rand(1..12)
    )
  end
end
