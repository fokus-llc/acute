
module Acute::Nodes

  class SeasonFragmentNode < TemporalUnitNode

    def scale
      :season_fragment
    end

    def fragment
      fraction_name.to_sym
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

    def repeating_season_node
      fractional_season_node.repeating_season_node
    end

    def season_name
      repeating_season_node.name.value
    end

    def fraction_name
      fractional_season_node.fraction_node.name.text_value
    end

    def fraction_node
      fractional_repeating_season_node.fraction_node
    end

    def hemisphere_name
      node = repeating_season_node.hemisphere_node
      node.empty? ? nil : node.value
    end

  end

end

