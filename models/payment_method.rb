# frozen_string_literal: true

class PaymentMethod
  attr_reader :id, :type, :user_id

  @@auto_id = 1
  @@payment_methods = {}
  def initialize(type, user_id)
    @id = @@auto_id

    @@auto_id += 1
    @user_id = user_id
    @type = type
    @@payment_methods[@id] = self
  end
end
