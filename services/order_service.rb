# frozen_string_literal: true

require_relative '../models/order'
require_relative '../models/payment'
require_relative './shipment_service'

class OrderService
  class << self
    def place_order(user_id, order_info, payment_method, address_id)
      order = Order.new(user_id, nil, order_info)
      amount = calculate_bill(order_info)
      payment = Payment.new(order.id, payment_method.id, amount)
      payment.make_transcation
      order.update_order(payment.id)
      shipment = ShipmentService.ship_order(order.id, address_id)
      puts "Shipment details shipment_id #{shipment.id} with status #{shipment.status}"
    end

    def get_user_orders(user_id)
      Order.fetch_user_orders(user_id)
    end

    private

    def calculate_bill(order_info)
      total = 0
      order_info.each do |cartline|
        total += cartline[:product_price] * cartline[:quantity]
      end

      total * 1.18 #GST
    end
  end
end
