
module Acute::Nodes

  class SeasonNode < TemporalUnitNode
    def scale
      :season
    end

    def calendar_season
      season_name.to_sym
    end

    def season_style
      (style = hemisphere_name) ? style.to_sym : nil
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

    def season_name
      repeating_season_node.name.value
    end

    def hemisphere_name
      node = repeating_season_node.hemisphere_node
      node.empty? ? nil : node.value
    end

  end

end

