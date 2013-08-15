
module Acute::Nodes

  class DateNode < TemporalUnitNode

    def scale
      :date
    end

    def month_day_index
      repeating_date_node.month_day_index
    end

    def month_index
      repeating_date_node.month_index
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

  end

end

