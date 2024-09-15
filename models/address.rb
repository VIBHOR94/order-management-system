# frozen_string_literal: true

class Address
  attr_reader :id, :user_id, :info, :pincode

  @@auto_id = 1
  @@addresses = {}
  def initialize(user_id, info, pincode)
    @id = @@auto_id

    @@auto_id += 1
    @user_id = user_id
    @info = info
    @pincode = pincode
    @@addresses[@id] = self
  end
end
