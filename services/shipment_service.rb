# frozen_string_literal: true

require_relative '../models/shipment'

class ShipmentService
  class << self
    def ship_order(order_id, address_id)
      Shipment.new(order_id, address_id)
    end
  end
end
