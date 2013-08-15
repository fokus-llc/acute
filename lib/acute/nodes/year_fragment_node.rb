
module Acute::Nodes

  class YearFragmentNode < TemporalUnitNode

    def scale
      :year_fragment
    end

    def fragment
      fraction_name.to_sym
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

    def fraction_name
      fraction_node.name.text_value
    end

  end

end

