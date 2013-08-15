# Autogenerated from a Treetop grammar. Edits may be lost.



module Acute::Rules
  module CalendarYears
    include Treetop::Runtime

    def root
      @root ||= :precise_fractional_year
    end

    module PreciseFractionalYear0
      def fraction_node
        elements[0]
      end

      def year_node
        elements[1]
      end
    end

    def _nt_precise_fractional_year
      start_index = index
      if node_cache[:precise_fractional_year].has_key?(index)
        cached = node_cache[:precise_fractional_year][index]
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
        r2 = _nt_precise_year
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::YearFragmentNode,input, i0...index, s0)
        r0.extend(PreciseFractionalYear0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_fractional_year][start_index] = r0

      r0
    end

    module PreciseYear0
      def year_number_node
        elements[0]
      end

      def era_affix
        elements[1]
      end

      def style_affix
        elements[2]
      end
    end

    def _nt_precise_year
      start_index = index
      if node_cache[:precise_year].has_key?(index)
        cached = node_cache[:precise_year][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_natural_number
      s0 << r1
      if r1
        r3 = _nt_year_affixed_era
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          r5 = _nt_year_affixed_style
          if r5
            r4 = r5
          else
            r4 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(Acute::Nodes::YearNode,input, i0...index, s0)
        r0.extend(PreciseYear0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:precise_year][start_index] = r0

      r0
    end

    module YearAffixedEra0
      def year_era_separator
        elements[0]
      end

      def era
        elements[1]
      end
    end

    def _nt_year_affixed_era
      start_index = index
      if node_cache[:year_affixed_era].has_key?(index)
        cached = node_cache[:year_affixed_era][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_year_era_separator
      s0 << r1
      if r1
        r2 = _nt_calendar_era
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(YearAffixedEra0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:year_affixed_era][start_index] = r0

      r0
    end

    module YearAffixedStyle0
      def required_hspace
        elements[0]
      end

      def style
        elements[1]
      end
    end

    def _nt_year_affixed_style
      start_index = index
      if node_cache[:year_affixed_style].has_key?(index)
        cached = node_cache[:year_affixed_style][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_required_hspace
      s0 << r1
      if r1
        r2 = _nt_calendar_style
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(YearAffixedStyle0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:year_affixed_style][start_index] = r0

      r0
    end

    def _nt_calendar_era
      start_index = index
      if node_cache[:calendar_era].has_key?(index)
        cached = node_cache[:calendar_era][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_era_bc
      if r1
        r0 = r1
      else
        r2 = _nt_era_ad
        if r2
          r0 = r2
        else
          r3 = _nt_era_bce
          if r3
            r0 = r3
          else
            r4 = _nt_era_ce
            if r4
              r0 = r4
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end

      node_cache[:calendar_era][start_index] = r0

      r0
    end

    module EraBc0
      def optional_hspace
        elements[2]
      end

    end

    module EraBc1
      def value; "bce"; end
    end

    def _nt_era_bc
      start_index = index
      if node_cache[:era_bc].has_key?(index)
        cached = node_cache[:era_bc][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("b", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("b")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          r4 = _nt_optional_hspace
          s0 << r4
          if r4
            if has_terminal?("c", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("c")
              r5 = nil
            end
            s0 << r5
            if r5
              r7 = _nt_abbreviated
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(EraBc0)
        r0.extend(EraBc1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:era_bc][start_index] = r0

      r0
    end

    module EraBce0
      def optional_hspace1
        elements[2]
      end

      def optional_hspace2
        elements[5]
      end

    end

    module EraBce1
      def value; "bce"; end
    end

    def _nt_era_bce
      start_index = index
      if node_cache[:era_bce].has_key?(index)
        cached = node_cache[:era_bce][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("b", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("b")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          r4 = _nt_optional_hspace
          s0 << r4
          if r4
            if has_terminal?("c", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("c")
              r5 = nil
            end
            s0 << r5
            if r5
              r7 = _nt_abbreviated
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
              if r6
                r8 = _nt_optional_hspace
                s0 << r8
                if r8
                  if has_terminal?("e", false, index)
                    r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("e")
                    r9 = nil
                  end
                  s0 << r9
                  if r9
                    r11 = _nt_abbreviated
                    if r11
                      r10 = r11
                    else
                      r10 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r10
                  end
                end
              end
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(EraBce0)
        r0.extend(EraBce1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:era_bce][start_index] = r0

      r0
    end

    module EraCe0
      def optional_hspace
        elements[2]
      end

    end

    module EraCe1
      def value; "ce"; end
    end

    def _nt_era_ce
      start_index = index
      if node_cache[:era_ce].has_key?(index)
        cached = node_cache[:era_ce][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("c", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("c")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          r4 = _nt_optional_hspace
          s0 << r4
          if r4
            if has_terminal?("e", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("e")
              r5 = nil
            end
            s0 << r5
            if r5
              r7 = _nt_abbreviated
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(EraCe0)
        r0.extend(EraCe1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:era_ce][start_index] = r0

      r0
    end

    module EraAd0
      def optional_hspace
        elements[2]
      end

    end

    module EraAd1
      def value; "ce"; end
    end

    def _nt_era_ad
      start_index = index
      if node_cache[:era_ad].has_key?(index)
        cached = node_cache[:era_ad][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("a", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("a")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          r4 = _nt_optional_hspace
          s0 << r4
          if r4
            if has_terminal?("d", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("d")
              r5 = nil
            end
            s0 << r5
            if r5
              r7 = _nt_abbreviated
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(EraAd0)
        r0.extend(EraAd1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:era_ad][start_index] = r0

      r0
    end

    def _nt_calendar_style
      start_index = index
      if node_cache[:calendar_style].has_key?(index)
        cached = node_cache[:calendar_style][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_style_old
      if r1
        r0 = r1
      else
        r2 = _nt_style_new
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:calendar_style][start_index] = r0

      r0
    end

    def _nt_style_old
      start_index = index
      if node_cache[:style_old].has_key?(index)
        cached = node_cache[:style_old][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_style_old_bare
      if r1
        r0 = r1
      else
        r2 = _nt_style_old_brackets
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:style_old][start_index] = r0

      r0
    end

    module StyleOldBare0
    end

    module StyleOldBare1
      def value; "os"; end
    end

    def _nt_style_old_bare
      start_index = index
      if node_cache[:style_old_bare].has_key?(index)
        cached = node_cache[:style_old_bare][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("o", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("o")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          if has_terminal?("s", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("s")
            r4 = nil
          end
          s0 << r4
          if r4
            r6 = _nt_abbreviated
            if r6
              r5 = r6
            else
              r5 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r5
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StyleOldBare0)
        r0.extend(StyleOldBare1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:style_old_bare][start_index] = r0

      r0
    end

    module StyleOldBrackets0
      def open_bracket
        elements[0]
      end

      def style_old_bare
        elements[1]
      end

      def close_bracket
        elements[2]
      end
    end

    module StyleOldBrackets1
      def value; "os"; end
    end

    def _nt_style_old_brackets
      start_index = index
      if node_cache[:style_old_brackets].has_key?(index)
        cached = node_cache[:style_old_brackets][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_open_bracket
      s0 << r1
      if r1
        r2 = _nt_style_old_bare
        s0 << r2
        if r2
          r3 = _nt_close_bracket
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StyleOldBrackets0)
        r0.extend(StyleOldBrackets1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:style_old_brackets][start_index] = r0

      r0
    end

    def _nt_style_new
      start_index = index
      if node_cache[:style_new].has_key?(index)
        cached = node_cache[:style_new][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_style_new_bare
      if r1
        r0 = r1
      else
        r2 = _nt_style_new_brackets
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:style_new][start_index] = r0

      r0
    end

    module StyleNewBare0
    end

    module StyleNewBare1
      def value; "ns"; end
    end

    def _nt_style_new_bare
      start_index = index
      if node_cache[:style_new_bare].has_key?(index)
        cached = node_cache[:style_new_bare][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("n", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("n")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          if has_terminal?("s", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("s")
            r4 = nil
          end
          s0 << r4
          if r4
            r6 = _nt_abbreviated
            if r6
              r5 = r6
            else
              r5 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r5
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StyleNewBare0)
        r0.extend(StyleNewBare1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:style_new_bare][start_index] = r0

      r0
    end

    module StyleNewBrackets0
      def open_bracket
        elements[0]
      end

      def style_new_bare
        elements[1]
      end

      def close_bracket
        elements[2]
      end
    end

    module StyleNewBrackets1
      def value; "ns"; end
    end

    def _nt_style_new_brackets
      start_index = index
      if node_cache[:style_new_brackets].has_key?(index)
        cached = node_cache[:style_new_brackets][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_open_bracket
      s0 << r1
      if r1
        r2 = _nt_style_new_bare
        s0 << r2
        if r2
          r3 = _nt_close_bracket
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StyleNewBrackets0)
        r0.extend(StyleNewBrackets1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:style_new_brackets][start_index] = r0

      r0
    end

    module StyleNewBare0
    end

    module StyleNewBare1
      def value; "ns"; end
    end

    def _nt_style_new_bare
      start_index = index
      if node_cache[:style_new_bare].has_key?(index)
        cached = node_cache[:style_new_bare][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("n", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("n")
        r1 = nil
      end
      s0 << r1
      if r1
        r3 = _nt_abbreviated
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r2
        if r2
          if has_terminal?("s", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("s")
            r4 = nil
          end
          s0 << r4
          if r4
            r6 = _nt_abbreviated
            if r6
              r5 = r6
            else
              r5 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r5
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StyleNewBare0)
        r0.extend(StyleNewBare1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:style_new_bare][start_index] = r0

      r0
    end

    module YearEraSeparator0
      def optional_hspace1
        elements[0]
      end

      def optional_hspace2
        elements[2]
      end
    end

    def _nt_year_era_separator
      start_index = index
      if node_cache[:year_era_separator].has_key?(index)
        cached = node_cache[:year_era_separator][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      r2 = _nt_optional_hspace
      s1 << r2
      if r2
        if has_terminal?('\G[,-]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        s1 << r3
        if r3
          r4 = _nt_optional_hspace
          s1 << r4
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(YearEraSeparator0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        r5 = _nt_required_hspace
        if r5
          r0 = r5
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:year_era_separator][start_index] = r0

      r0
    end

  end

  class CalendarYearsParser < Treetop::Runtime::CompiledParser
    include CalendarYears
  end

end
