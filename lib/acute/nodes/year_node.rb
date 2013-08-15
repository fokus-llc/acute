
module Acute::Nodes

  class YearNode < TemporalUnitNode

    def scale
      :year
    end

    def year_number
      year_number_node.value
    end

    def year_style
      (style_s = style_name) ? style_s.to_sym : nil
    end

    def year_era
      (era_s = era_name) ? era_s.to_sym : nil
    end

    private

    def style_name
      affix = style_affix
      affix.empty? ? nil : affix.style.value
    end

    def era_name
      affix = era_affix
      affix.empty? ? nil : affix.era.value
    end

  end

end

