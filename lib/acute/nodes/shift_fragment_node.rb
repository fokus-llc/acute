
module Acute::Nodes

  class ShiftFragmentNode < TemporalUnitNode

    def scale
      :shift_fragment
    end

    def fragment
      fraction_name.to_sym
    end

    def shift
      shift_name.to_sym
    end

    def month_day_index
      date_node.month_day_index
    end

    def month_index
      date_node.month_index
    end

    def year_number
      date_node.year_number
    end

    def year_style
      date_node.year_style
    end

    def year_era
      date_node.year_era
    end

    private

    def repeating_shift_node
      fractional_shift_node.repeating_shift_node
    end

    def shift_name
      repeating_shift_node.value
    end

    def fraction_node
      fractional_shift_node.fraction_node
    end

    def fraction_name
      fraction_node.name.text_value
    end

  end

end

