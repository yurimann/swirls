class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.check_if_taxable(cart)
    non_taxable = 6
    tax_rate = 0.13
    if !cart.nil?
      total = 0
      subtotal = 0
      final_price = 0
      cart.each do |x|
        total += x["quantity"]
        price = Product.find(x["product_id"]).price
        subtotal = subtotal + (x["quantity"] * price)
      end
    end
    if total < non_taxable
      final_price = subtotal + (subtotal * tax_rate)
    else
      final_price = subtotal
    end
    final_price
  end

end
