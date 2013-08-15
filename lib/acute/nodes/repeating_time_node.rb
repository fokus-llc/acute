
module Acute::Nodes

  class RepeatingTimeNode < PartialTemporalUnitNode

    # clock_time_node zone_node?

    def scale
      :time
    end

    def clock_time
      clock_time_node.value
    end

    def time_zone
      (zone = zone_name) ? zone.to_sym : nil
    end

    private

    def zone_name
      zone_node.empty? ? nil : zone_node.value
    end

  end

end

