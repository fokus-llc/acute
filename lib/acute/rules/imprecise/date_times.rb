# Autogenerated from a Treetop grammar. Edits may be lost.



module Acute::Rules::Imprecise
  module DateTimes
    include Treetop::Runtime

    def root
      @root ||= :qualified_time
    end

    def _nt_qualified_time
      start_index = index
      if node_cache[:qualified_time].has_key?(index)
        cached = node_cache[:qualified_time][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_precise_time
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_time_of_date
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_time
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:qualified_time][start_index] = r0

      r0
    end

    module ImpreciseTimeOfDate0
      def imprecise
        elements[0]
      end

      def time_date_separator
        elements[1]
      end

      def date_node
        elements[2]
      end
    end

    module ImpreciseTimeOfDate1
      def precision; :date; end
      def repeating_time_node; imprecise.repeating_time_node; end
    end

    def _nt_imprecise_time_of_date
      start_index = index
      if node_cache[:imprecise_time_of_date].has_key?(index)
        cached = node_cache[:imprecise_time_of_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_imprecise_repeating_time
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
        r0.extend(ImpreciseTimeOfDate0)
        r0.extend(ImpreciseTimeOfDate1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_time_of_date][start_index] = r0

      r0
    end

    module ImpreciseTime0
      def open_parens
        elements[0]
      end

      def imprecise
        elements[1]
      end

      def close_parens
        elements[2]
      end
    end

    module ImpreciseTime1
      def repeating_time_node; imprecise.repeating_time_node; end
      def date_node; imprecise.date_node; end
      def precision; nil; end
    end

    def _nt_imprecise_time
      start_index = index
      if node_cache[:imprecise_time].has_key?(index)
        cached = node_cache[:imprecise_time][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_open_parens
      s0 << r1
      if r1
        r2 = _nt_precise_time
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateTimeNode,input, i0...index, s0)
        r0.extend(ImpreciseTime0)
        r0.extend(ImpreciseTime1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_time][start_index] = r0

      r0
    end

    module ImpreciseRepeatingTime0
      def open_parens
        elements[0]
      end

      def repeating_time_node
        elements[1]
      end

      def close_parens
        elements[2]
      end
    end

    def _nt_imprecise_repeating_time
      start_index = index
      if node_cache[:imprecise_repeating_time].has_key?(index)
        cached = node_cache[:imprecise_repeating_time][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_open_parens
      s0 << r1
      if r1
        r2 = _nt_repeating_time
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseRepeatingTime0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_repeating_time][start_index] = r0

      r0
    end

  end

  class DateTimesParser < Treetop::Runtime::CompiledParser
    include DateTimes
  end

end

