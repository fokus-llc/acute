# Autogenerated from a Treetop grammar. Edits may be lost.



module Acute::Rules::Imprecise
  module CalendarDates
    include Treetop::Runtime

    def root
      @root ||= :qualified_date
    end

    def _nt_qualified_date
      start_index = index
      if node_cache[:qualified_date].has_key?(index)
        cached = node_cache[:qualified_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_precise_date
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_day_date
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_month_and_day_date
          if r3
            r0 = r3
          else
            r4 = _nt_imprecise_date
            if r4
              r0 = r4
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end

      node_cache[:qualified_date][start_index] = r0

      r0
    end

    module ImpreciseDayDate0
      def repeating_date_node
        elements[0]
      end

      def date_year_separator
        elements[1]
      end

      def year_node
        elements[2]
      end
    end

    module ImpreciseDayDate1
      def precise_day?; false; end

      def precision; :month; end
    end

    def _nt_imprecise_day_date
      start_index = index
      if node_cache[:imprecise_day_date].has_key?(index)
        cached = node_cache[:imprecise_day_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_imprecise_day_repeating_date
      s0 << r1
      if r1
        r2 = _nt_date_year_separator
        s0 << r2
        if r2
          r3 = _nt_precise_year
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateNode,input, i0...index, s0)
        r0.extend(ImpreciseDayDate0)
        r0.extend(ImpreciseDayDate1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_date][start_index] = r0

      r0
    end

    module ImpreciseMonthAndDayDate0
      def repeating_date_node
        elements[0]
      end

      def date_year_separator
        elements[1]
      end

      def year_node
        elements[2]
      end
    end

    module ImpreciseMonthAndDayDate1
      def precise_month_and_day?; false; end

      def precision; :year; end
    end

    def _nt_imprecise_month_and_day_date
      start_index = index
      if node_cache[:imprecise_month_and_day_date].has_key?(index)
        cached = node_cache[:imprecise_month_and_day_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_imprecise_repeating_date
      s0 << r1
      if r1
        r2 = _nt_date_year_separator
        s0 << r2
        if r2
          r3 = _nt_precise_year
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateNode,input, i0...index, s0)
        r0.extend(ImpreciseMonthAndDayDate0)
        r0.extend(ImpreciseMonthAndDayDate1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_month_and_day_date][start_index] = r0

      r0
    end

    module ImpreciseDate0
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

    module ImpreciseDate1
      def precise?; false; end
      def year_node; imprecise.year_node; end
      def repeating_date_node; imprecise.repeating_date_node; end

      def precision; nil; end
    end

    def _nt_imprecise_date
      start_index = index
      if node_cache[:imprecise_date].has_key?(index)
        cached = node_cache[:imprecise_date][index]
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
        r2 = _nt_precise_date
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateNode,input, i0...index, s0)
        r0.extend(ImpreciseDate0)
        r0.extend(ImpreciseDate1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_date][start_index] = r0

      r0
    end

    def _nt_qualified_repeating_date
      start_index = index
      if node_cache[:qualified_repeating_date].has_key?(index)
        cached = node_cache[:qualified_repeating_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_qualified_repeating_date_long_month
      if r1
        r0 = r1
      else
        r2 = _nt_qualified_repeating_date_short_month
        if r2
          r0 = r2
        else
          r3 = _nt_qualified_repeating_date_february
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:qualified_repeating_date][start_index] = r0

      r0
    end

    def _nt_qualified_repeating_date_long_month
      start_index = index
      if node_cache[:qualified_repeating_date_long_month].has_key?(index)
        cached = node_cache[:qualified_repeating_date_long_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_precise_repeating_date_long_month
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_day_repeating_date_long_month
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_repeating_date_long_month
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:qualified_repeating_date_long_month][start_index] = r0

      r0
    end

    def _nt_qualified_repeating_date_short_month
      start_index = index
      if node_cache[:qualified_repeating_date_short_month].has_key?(index)
        cached = node_cache[:qualified_repeating_date_short_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_precise_repeating_date_short_month
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_day_repeating_date_short_month
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_repeating_date_short_month
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:qualified_repeating_date_short_month][start_index] = r0

      r0
    end

    def _nt_qualified_repeating_date_february
      start_index = index
      if node_cache[:qualified_repeating_date_february].has_key?(index)
        cached = node_cache[:qualified_repeating_date_february][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_precise_repeating_date_february
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_day_repeating_date_february
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_repeating_date_february
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:qualified_repeating_date_february][start_index] = r0

      r0
    end

    def _nt_imprecise_day_repeating_date
      start_index = index
      if node_cache[:imprecise_day_repeating_date].has_key?(index)
        cached = node_cache[:imprecise_day_repeating_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_imprecise_day_repeating_date_long_month
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_day_repeating_date_short_month
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_day_repeating_date_february
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:imprecise_day_repeating_date][start_index] = r0

      r0
    end

    module ImpreciseDayRepeatingDateLongMonth0
      def month_node
        elements[0]
      end

      def month_day_separator
        elements[1]
      end

      def imprecise
        elements[2]
      end
    end

    module ImpreciseDayRepeatingDateLongMonth1
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_day_repeating_date_long_month
      start_index = index
      if node_cache[:imprecise_day_repeating_date_long_month].has_key?(index)
        cached = node_cache[:imprecise_day_repeating_date_long_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_calendar_long_month
      s0 << r1
      if r1
        r2 = _nt_month_day_separator
        s0 << r2
        if r2
          r3 = _nt_imprecise_day_of_long_month
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::RepeatingDateNode,input, i0...index, s0)
        r0.extend(ImpreciseDayRepeatingDateLongMonth0)
        r0.extend(ImpreciseDayRepeatingDateLongMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_repeating_date_long_month][start_index] = r0

      r0
    end

    module ImpreciseDayRepeatingDateShortMonth0
      def month_node
        elements[0]
      end

      def month_day_separator
        elements[1]
      end

      def imprecise
        elements[2]
      end
    end

    module ImpreciseDayRepeatingDateShortMonth1
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_day_repeating_date_short_month
      start_index = index
      if node_cache[:imprecise_day_repeating_date_short_month].has_key?(index)
        cached = node_cache[:imprecise_day_repeating_date_short_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_calendar_short_month
      s0 << r1
      if r1
        r2 = _nt_month_day_separator
        s0 << r2
        if r2
          r3 = _nt_imprecise_day_of_short_month
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::RepeatingDateNode,input, i0...index, s0)
        r0.extend(ImpreciseDayRepeatingDateShortMonth0)
        r0.extend(ImpreciseDayRepeatingDateShortMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_repeating_date_short_month][start_index] = r0

      r0
    end

    module ImpreciseDayRepeatingDateFebruary0
      def month_node
        elements[0]
      end

      def month_day_separator
        elements[1]
      end

      def imprecise
        elements[2]
      end
    end

    module ImpreciseDayRepeatingDateFebruary1
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_day_repeating_date_february
      start_index = index
      if node_cache[:imprecise_day_repeating_date_february].has_key?(index)
        cached = node_cache[:imprecise_day_repeating_date_february][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_calendar_february
      s0 << r1
      if r1
        r2 = _nt_month_day_separator
        s0 << r2
        if r2
          r3 = _nt_imprecise_day_of_february
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::RepeatingDateNode,input, i0...index, s0)
        r0.extend(ImpreciseDayRepeatingDateFebruary0)
        r0.extend(ImpreciseDayRepeatingDateFebruary1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_repeating_date_february][start_index] = r0

      r0
    end

    def _nt_imprecise_repeating_date
      start_index = index
      if node_cache[:imprecise_repeating_date].has_key?(index)
        cached = node_cache[:imprecise_repeating_date][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_imprecise_repeating_date_long_month
      if r1
        r0 = r1
      else
        r2 = _nt_imprecise_repeating_date_short_month
        if r2
          r0 = r2
        else
          r3 = _nt_imprecise_repeating_date_february
          if r3
            r0 = r3
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:imprecise_repeating_date][start_index] = r0

      r0
    end

    module ImpreciseRepeatingDateLongMonth0
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

    module ImpreciseRepeatingDateLongMonth1
      def month_node; imprecise.month_node; end
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_repeating_date_long_month
      start_index = index
      if node_cache[:imprecise_repeating_date_long_month].has_key?(index)
        cached = node_cache[:imprecise_repeating_date_long_month][index]
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
        r2 = _nt_precise_repeating_date_long_month
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseRepeatingDateLongMonth0)
        r0.extend(ImpreciseRepeatingDateLongMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_repeating_date_long_month][start_index] = r0

      r0
    end

    module ImpreciseRepeatingDateShortMonth0
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

    module ImpreciseRepeatingDateShortMonth1
      def month_node; imprecise.month_node; end
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_repeating_date_short_month
      start_index = index
      if node_cache[:imprecise_repeating_date_short_month].has_key?(index)
        cached = node_cache[:imprecise_repeating_date_short_month][index]
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
        r2 = _nt_precise_repeating_date_short_month
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseRepeatingDateShortMonth0)
        r0.extend(ImpreciseRepeatingDateShortMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_repeating_date_short_month][start_index] = r0

      r0
    end

    module ImpreciseRepeatingDateFebruary0
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

    module ImpreciseRepeatingDateFebruary1
      def month_node; imprecise.month_node; end
      def day_number_node; imprecise.day_number_node; end
    end

    def _nt_imprecise_repeating_date_february
      start_index = index
      if node_cache[:imprecise_repeating_date_february].has_key?(index)
        cached = node_cache[:imprecise_repeating_date_february][index]
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
        r2 = _nt_precise_repeating_date_february
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseRepeatingDateFebruary0)
        r0.extend(ImpreciseRepeatingDateFebruary1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_repeating_date_february][start_index] = r0

      r0
    end

    def _nt_qualified_day_of_long_month
      start_index = index
      if node_cache[:qualified_day_of_long_month].has_key?(index)
        cached = node_cache[:qualified_day_of_long_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_imprecise_day_of_long_month
      if r1
        r0 = r1
      else
        r2 = _nt_precise_day_of_long_month
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:qualified_day_of_long_month][start_index] = r0

      r0
    end

    module ImpreciseDayOfLongMonth0
      def open_parens
        elements[0]
      end

      def day_number_node
        elements[1]
      end

      def close_parens
        elements[2]
      end
    end

    module ImpreciseDayOfLongMonth1
      def value; day_number_node.value; end
      def precise?; day_number_node.precise?; end

      def precision; :month; end
    end

    def _nt_imprecise_day_of_long_month
      start_index = index
      if node_cache[:imprecise_day_of_long_month].has_key?(index)
        cached = node_cache[:imprecise_day_of_long_month][index]
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
        r2 = _nt_precise_day_of_long_month
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseDayOfLongMonth0)
        r0.extend(ImpreciseDayOfLongMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_of_long_month][start_index] = r0

      r0
    end

    def _nt_qualified_day_of_short_month
      start_index = index
      if node_cache[:qualified_day_of_short_month].has_key?(index)
        cached = node_cache[:qualified_day_of_short_month][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_imprecise_day_of_short_month
      if r1
        r0 = r1
      else
        r2 = _nt_precise_day_of_short_month
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:qualified_day_of_short_month][start_index] = r0

      r0
    end

    module ImpreciseDayOfShortMonth0
      def open_parens
        elements[0]
      end

      def day_number_node
        elements[1]
      end

      def close_parens
        elements[2]
      end
    end

    module ImpreciseDayOfShortMonth1
      def value; day_number_node.value; end
    end

    def _nt_imprecise_day_of_short_month
      start_index = index
      if node_cache[:imprecise_day_of_short_month].has_key?(index)
        cached = node_cache[:imprecise_day_of_short_month][index]
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
        r2 = _nt_precise_day_of_short_month
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseDayOfShortMonth0)
        r0.extend(ImpreciseDayOfShortMonth1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_of_short_month][start_index] = r0

      r0
    end

    def _nt_qualified_day_of_february
      start_index = index
      if node_cache[:qualified_day_of_february].has_key?(index)
        cached = node_cache[:qualified_day_of_february][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_imprecise_day_of_february
      if r1
        r0 = r1
      else
        r2 = _nt_precise_day_of_february
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:qualified_day_of_february][start_index] = r0

      r0
    end

    module ImpreciseDayOfFebruary0
      def open_parens
        elements[0]
      end

      def day_number_node
        elements[1]
      end

      def close_parens
        elements[2]
      end
    end

    module ImpreciseDayOfFebruary1
      def value; day_number_node.value; end
    end

    def _nt_imprecise_day_of_february
      start_index = index
      if node_cache[:imprecise_day_of_february].has_key?(index)
        cached = node_cache[:imprecise_day_of_february][index]
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
        r2 = _nt_precise_day_of_february
        s0 << r2
        if r2
          r3 = _nt_close_parens
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ImpreciseDayOfFebruary0)
        r0.extend(ImpreciseDayOfFebruary1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:imprecise_day_of_february][start_index] = r0

      r0
    end

  end

  class CalendarDatesParser < Treetop::Runtime::CompiledParser
    include CalendarDates
  end

end

