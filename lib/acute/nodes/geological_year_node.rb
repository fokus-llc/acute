
module Acute::Nodes

  class GeologicalYearNode < TemporalUnitNode

    def scale
      :year
    end

    def year_number
      year_number_node.value
    end

    def year_era
      :bp
    end

  end

end

