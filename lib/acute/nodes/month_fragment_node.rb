
module Acute::Nodes

  class MonthFragmentNode < TemporalUnitNode

    def scale
      :month_fragment
    end

    def fragment
      fraction_name.to_sym
    end

    def month_index
      repeating_month_node.index
    end

    def year_number
      year_node.year_number
    end

    def year_style
      year_node.year_style
    end

    def year_era
      year_node.year_era
    end

    private

    def repeating_month_node
      fractional_month_node.repeating_month_node
    end

    def fraction_name
      fractional_month_node.fraction_node.name.text_value
    end

  end

end

