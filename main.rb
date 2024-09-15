# frozen_string_literal: true

require_relative './models/user'
require_relative './models/address'
require_relative './models/payment_method'
require_relative './models/product'

def run_program
  user = User.new('Tanmaya', 'tanmaya.gupta@hingehealth.com')
  puts "User name is #{user.name}"

  address_one = Address.new(user.id, 'Address one', 560_063)
  puts "Address is #{address_one.info}"

  user.add_address(address_one)

  payment_method = PaymentMethod.new(:credit_card, user.id)
  user.add_payment_method(payment_method)

  product_one = Product.new('Watch1', 500)
  product_two = Product.new('Watch2', 3500)

  order_info = [
    { product_id: product_one.id, product_price: product_one.price, quantity: 2 },
    { product_id: product_two.id, product_price: product_two.price, quantity: 3 }
  ]
  user.place_order(order_info, payment_method, address_one)
  user.view_orders
end

run_program
