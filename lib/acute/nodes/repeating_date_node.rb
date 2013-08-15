
module Acute::Nodes

  class RepeatingDateNode < PartialTemporalUnitNode

    # month_node, day_number_node

    def scale
      :date
    end

    def month_day_index
      day_number_node.value
    end

    def month_index
      month_node.index
    end

    private

    def month_node
      repeating_date_node.month_node
    end

  end

end

