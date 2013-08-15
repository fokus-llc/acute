# Autogenerated from a Treetop grammar. Edits may be lost.



module Acute::Rules
  module DateShifts
    include Treetop::Runtime

    def root
      @root ||= :precise_fractional_shift
    end

    module PreciseFractionalShift0
      def fractional_shift_node
        elements[0]
      end

      def shift_date_separator
        elements[1]
      end

      def date_node
        elements[2]
      end
    end

    def _nt_precise_fractional_shift
      start_index = index
      if node_cache[:precise_fractional_shift].has_key?(index)
        cached = node_cache[:precise_fractional_shift][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_precise_repeating_fractional_shift
      s0 << r1
      if r1
        r2 = _nt_shift_date_separator
        s0 << r2
        if r2
          r3 = _nt_precise_date
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::ShiftFragmentNode,input, i0...index, s0)
        r0.extend(PreciseFractionalShift0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_fractional_shift][start_index] = r0

      r0
    end

    module PreciseRepeatingFractionalShift0
      def fraction_node
        elements[0]
      end

      def repeating_shift_node
        elements[1]
      end
    end

    def _nt_precise_repeating_fractional_shift
      start_index = index
      if node_cache[:precise_repeating_fractional_shift].has_key?(index)
        cached = node_cache[:precise_repeating_fractional_shift][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_fraction
      s0 << r1
      if r1
        r2 = _nt_precise_repeating_shift
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(PreciseRepeatingFractionalShift0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_repeating_fractional_shift][start_index] = r0

      r0
    end

    module PreciseShift0
      def repeating_shift_node
        elements[0]
      end

      def shift_date_separator
        elements[1]
      end

      def date_node
        elements[2]
      end
    end

    def _nt_precise_shift
      start_index = index
      if node_cache[:precise_shift].has_key?(index)
        cached = node_cache[:precise_shift][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_precise_repeating_shift
      s0 << r1
      if r1
        r2 = _nt_shift_date_separator
        s0 << r2
        if r2
          r3 = _nt_precise_date
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::DateShiftNode,input, i0...index, s0)
        r0.extend(PreciseShift0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_shift][start_index] = r0

      r0
    end

    def _nt_precise_repeating_shift
      start_index = index
      if node_cache[:precise_repeating_shift].has_key?(index)
        cached = node_cache[:precise_repeating_shift][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_shift_morning
      if r1
        r0 = r1
      else
        r2 = _nt_shift_midday
        if r2
          r0 = r2
        else
          r3 = _nt_shift_afternoon
          if r3
            r0 = r3
          else
            r4 = _nt_shift_evening
            if r4
              r0 = r4
            else
              r5 = _nt_shift_night
              if r5
                r0 = r5
              else
                @index = i0
                r0 = nil
              end
            end
          end
        end
      end

      node_cache[:precise_repeating_shift][start_index] = r0

      r0
    end

    module ShiftMorning0
      def value; "morning"; end
    end

    def _nt_shift_morning
      start_index = index
      if node_cache[:shift_morning].has_key?(index)
        cached = node_cache[:shift_morning][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("morning", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 7))
        r0.extend(ShiftMorning0)
        @index += 7
      else
        terminal_parse_failure("morning")
        r0 = nil
      end

      node_cache[:shift_morning][start_index] = r0

      r0
    end

    module ShiftMidday0
    end

    module ShiftMidday1
      def value; "midday"; end
    end

    def _nt_shift_midday
      start_index = index
      if node_cache[:shift_midday].has_key?(index)
        cached = node_cache[:shift_midday][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("mid", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure("mid")
        r1 = nil
      end
      s0 << r1
      if r1
        if has_terminal?('\G[ -]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          if has_terminal?("day", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure("day")
            r4 = nil
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ShiftMidday0)
        r0.extend(ShiftMidday1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:shift_midday][start_index] = r0

      r0
    end

    module ShiftAfternoon0
    end

    module ShiftAfternoon1
      def value; "afternoon"; end
    end

    def _nt_shift_afternoon
      start_index = index
      if node_cache[:shift_afternoon].has_key?(index)
        cached = node_cache[:shift_afternoon][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("after", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
        @index += 5
      else
        terminal_parse_failure("after")
        r1 = nil
      end
      s0 << r1
      if r1
        if has_terminal?('\G[ -]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          if has_terminal?("noon", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 4))
            @index += 4
          else
            terminal_parse_failure("noon")
            r4 = nil
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ShiftAfternoon0)
        r0.extend(ShiftAfternoon1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:shift_afternoon][start_index] = r0

      r0
    end

    module ShiftEvening0
      def value; "evening"; end
    end

    def _nt_shift_evening
      start_index = index
      if node_cache[:shift_evening].has_key?(index)
        cached = node_cache[:shift_evening][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("evening", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 7))
        r0.extend(ShiftEvening0)
        @index += 7
      else
        terminal_parse_failure("evening")
        r0 = nil
      end

      node_cache[:shift_evening][start_index] = r0

      r0
    end

    module ShiftNight0
      def value; "night"; end
    end

    def _nt_shift_night
      start_index = index
      if node_cache[:shift_night].has_key?(index)
        cached = node_cache[:shift_night][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("night", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 5))
        r0.extend(ShiftNight0)
        @index += 5
      else
        terminal_parse_failure("night")
        r0 = nil
      end

      node_cache[:shift_night][start_index] = r0

      r0
    end

    def _nt_shift_date_separator
      start_index = index
      if node_cache[:shift_date_separator].has_key?(index)
        cached = node_cache[:shift_date_separator][index]
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

      node_cache[:shift_date_separator][start_index] = r0

      r0
    end

  end

  class DateShiftsParser < Treetop::Runtime::CompiledParser
    include DateShifts
  end

end

