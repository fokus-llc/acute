
module Acute::Nodes

  class PartialTemporalUnitNode < Treetop::Runtime::SyntaxNode

    def precision
      :partial
    end

    def scale
      raise NotImplementedError
    end

    def fragment
      nil
    end

    def clock_time # dd:dd:dd
      nil
    end

    def time_zone
      nil
    end

    def shift # morning, midday, afternoon, evening, night
      nil
    end

    def month_day_index # 1-31
      nil
    end

    def month_index # 1-12
      nil
    end

    def calendar_season # winter, spring, summer, autumn
      nil
    end

    def season_style # northern, southern
      nil
    end

    def year_number
      nil
    end

    def year_style # os, ns
      nil
    end

    def year_era # bp, bce, ce
      nil
    end

  end

end

