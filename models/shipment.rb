# frozen_string_literal: true

class Shipment
  attr_reader :id, :order_id, :address_id, :status

  @@auto_id = 1
  @@shipments = {}
  def initialize(order_id, address_id)
    @id = @@auto_id

    @@auto_id += 1
    @address_id = address_id
    @order_id = order_id
    @status = :initiated
    @@shipments[@id] = self
  end
end
