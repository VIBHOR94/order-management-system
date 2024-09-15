# frozen_string_literal: true

class Order
  attr_reader :id, :user_id, :status, :payment_id, :order_info

  @@auto_id = 1
  @@orders = {}
  @@user_orders = {}
  def initialize(user_id, payment_id, order_info)
    @id = @@auto_id

    @@auto_id += 1
    @user_id = user_id
    @payment_id = payment_id
    @status = :pending
    @order_info = order_info
    @@orders[@id] = self
    store_user_orders
  end

  def update_order(payment_id)
    @payment_id = payment_id
    @status = :placed
  end

  def self.fetch_user_orders(user_id)
    order_ids = @@user_orders[user_id]

    puts "Order details for user #{user_id} is"
    order_ids.each do |order_id|
      order = @@orders[order_id]
      puts "Order id: #{order.id}, payment: #{order.payment_id} with status #{order.status}"
    end
  end

  private

  def store_user_orders
    @@user_orders[user_id] ||= []
    @@user_orders[user_id] << id
  end
end
