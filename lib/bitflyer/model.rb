require "virtus"

module Bitflyer
  class Order
    include Virtus.value_object

    values do
      attribute :child_order_acceptance_id, String
    end

    def id
      self.child_order_acceptance_id
    end
  end

  class Execution
    include Virtus.value_object

    values do
      attribute :id, Integer
      attribute :side, String
      attribute :price, Decimal
      attribute :size, Float
      attribute :exec_date, String
      attribute :buy_child_order_acceptance_id, String
      attribute :sell_child_order_acceptance_id, String
      attribute :child_order_id, String
      attribute :commission, Decimal
      attribute :child_order_acceptance_id, String
    end
  end

  class Balance
    include Virtus.value_object

    values do
      attribute :currency_code, String
      attribute :amount, Decimal
      attribute :available, Decimal
    end
  end

  class Collateral
    include Virtus.value_object

    values do
      attribute :collateral, Decimal
      attribute :open_position_pnl, Decimal
      attribute :require_collateral, Decimal
      attribute :keep_rate, Decimal
    end
  end
end
