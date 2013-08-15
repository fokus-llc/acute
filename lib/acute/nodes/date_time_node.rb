
module Acute::Nodes

  class DateTimeNode < TemporalUnitNode

    # date_node repeating_time_node

    def scale
      :time
    end

    def clock_time
      repeating_time_node.clock_time
    end

    def time_zone
      repeating_time_node.time_zone
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

  end

end

