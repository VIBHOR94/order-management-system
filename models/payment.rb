# frozen_string_literal: true

class Payment
  attr_reader :id, :order_id, :payment_method_id, :status, :amount

  @@auto_id = 1
  @@payments = {}
  def initialize(order_id, payment_method_id, amount)
    @id = @@auto_id

    @@auto_id += 1
    @order_id = order_id
    @payment_method_id = payment_method_id
    @status = :pending
    @amount = amount
    @@payments[@id] = self
  end

  def make_transcation
    @status = :completed
    puts "Payment is done for order id: #{order_id} uisng payment_method_id: #{payment_method_id} with amount = #{amount}"
  end
end
