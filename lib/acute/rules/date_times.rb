# Autogenerated from a Treetop grammar. Edits may be lost.



module Acute::Rules
  module DateTimes
    include Treetop::Runtime

    def root
      @root ||= :precise_time
    end

    module PreciseTime0
      def repeating_time_node
        elements[0]
      end

      def time_date_separator
        elements[1]
      end

      def date_node
        elements[2]
      end
    end

    def _nt_precise_time
      start_index = index
      if node_cache[:precise_time].has_key?(index)
        cached = node_cache[:precise_time][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_repeating_time
      s0 << r1
      if r1
        r2 = _nt_time_date_separator
        s0 << r2
        if r2
          r3 = _nt_precise_date
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateTimeNode,input, i0...index, s0)
        r0.extend(PreciseTime0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_time][start_index] = r0

      r0
    end

    def _nt_time_date_separator
      start_index = index
      if node_cache[:time_date_separator].has_key?(index)
        cached = node_cache[:time_date_separator][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_conjunction_on
      if r1
        r0 = r1
      else
        r2 = _nt_conjunction_comma
        if r2
          r0 = r2
        else
          r3 = _nt_required_hspace
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:time_date_separator][start_index] = r0

      r0
    end

  end

  class DateTimesParser < Treetop::Runtime::CompiledParser
    include DateTimes
  end

end

