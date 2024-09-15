# frozen_string_literal: true

class Product
  attr_reader :id, :name, :price

  @@auto_id = 1
  @@products = {}
  def initialize(name, price)
    @id = @@auto_id

    @@auto_id += 1
    @name = name
    @price = price
    @@products[@id] = self
  end
end
