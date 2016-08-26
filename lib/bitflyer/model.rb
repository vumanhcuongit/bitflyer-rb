require "virtus"

module Bitflyer
  class Order
    include Virtus.value_object

    values do
      attribute :child_order_acceptance_id, String
    end
  end
end
