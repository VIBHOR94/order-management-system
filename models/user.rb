# frozen_string_literal: true

require_relative './address'
require_relative '../services/order_service'

class User
  attr_reader :id, :name, :email, :payment_method_ids

  @@auto_id = 1
  @@users = {}
  def initialize(name, email)
    @id = @@auto_id

    @@auto_id += 1
    @name = name
    @email = email
    @@users[@id] = self
    @address_ids = []
    @payment_method_ids = []
  end

  def add_address(address)
    validate_address(address)
    @address_ids << address.id
  end

  def add_payment_method(payment_method)
    validate_payment_method(payment_method)
    @payment_method_ids << payment_method.id
  end

  def place_order(order_info, payment_method, address)
    validate_address(address)
    validate_payment_method(payment_method)
    OrderService.place_order(id, order_info, payment_method, address)
  end

  def view_orders
    OrderService.get_user_orders(id)
  end

  private

  def validate_address(address)
    raise 'Not an address instance' unless address.instance_of?(Address)
    raise 'Address does not belong to user' unless address.user_id == id
  end

  def validate_payment_method(payment_method)
    raise 'Not an payment_method instance' unless payment_method.instance_of?(PaymentMethod)
    raise 'PaymentMethod does not belong to user' unless payment_method.user_id == id
  end
end
