
module Acute::Nodes

  # A specific month in a specific calendar year
  class MonthNode < TemporalUnitNode

    # repeating_month_node year_node

    def scale
      :month
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

  end

end

