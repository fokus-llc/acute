
module Acute::Nodes

  class DateShiftNode < TemporalUnitNode

    def scale
      :shift
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

    def shift_name
      repeating_shift_node.value
    end

  end

end

