
require 'spec_helper'

describe "Acute grammar" do

  let(:parser) { Acute }

  context "parsing a geological year" do

    it "parses a year denoted in BP era" do
      root = parser.parse('2000 years before present')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 2000
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :bp
    end

    it "parses a commified year denoted in BP era" do
      root = parser.parse('2,000,000 b.p.')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 2_000_000
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :bp
    end

    it "parses a quantified year denoted in BP era" do
      root = parser.parse('5 trillion bp')
      root.elements.should have(1).node
      lexeme = root.elements[0]
      lexeme.should be_a_kind_of(Acute::Nodes::GeologicalYearNode)

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 5_000_000_000_000
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :bp
    end

  end

  context "parsing a precise calendar year" do

    it "parses a precise year without explicit era or style" do
      root = parser.parse('1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise year denoted in CE era" do
      root = parser.parse('1966 ad')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :ce
    end

    it "parses a precise year denoted in BCE era" do
      root = parser.parse('1 bc')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 1
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :bce
    end

    it "parses a precise year denoted explicitly in new style" do
      root = parser.parse('1580 [ns]')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 1580
      lexeme.year_style.should == :ns
      lexeme.year_era.should be_nil
    end

    it "parses a precise year denoted in explicit era and style" do
      root = parser.parse('1590 ad o.s.')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should == :year
      lexeme.year_number.should == 1590
      lexeme.year_style.should == :os
      lexeme.year_era.should == :ce
    end

  end

  context "parsing an imprecise calendar year" do

    it "parses an imprecise year" do
      root = parser.parse('(1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses imprecise year denoted in explicit era" do
      root = parser.parse('(1590 a.d.)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should be_nil
      lexeme.year_number.should == 1590
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :ce
    end

    it "parses imprecise year denoted in explicit style" do
      root = parser.parse('(1590 o.s.)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should be_nil
      lexeme.year_number.should == 1590
      lexeme.year_style.should == :os
      lexeme.year_era.should be_nil
    end

    it "parses imprecise year denoted in explicit era and style" do
      root = parser.parse('(1590 ad [os])')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year
      lexeme.precision.should be_nil
      lexeme.year_number.should == 1590
      lexeme.year_style.should == :os
      lexeme.year_era.should == :ce
    end

  end

  context "parsing a fractional calendar year" do

    it "parses the early fragment of a year" do
      root = parser.parse('early 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year_fragment
      lexeme.precision.should == :year_fragment
      lexeme.fragment.should == :early
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses the imprecise last fragment of a year" do
      root = parser.parse('(late 400 bc)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :year_fragment
      lexeme.precision.should be_nil
      lexeme.fragment.should == :late
      lexeme.year_number.should == 400
      lexeme.year_style.should be_nil
      lexeme.year_era.should == :bce
    end

  end

  context "parsing a calendar season" do

    it "parses a precise season with hemispheric indication" do
      root = parser.parse('fall 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.precision.should == :season
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise, explicitly southern hemisphere season" do
      root = parser.parse('s.h. summer 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season
      lexeme.precision.should == :season
      lexeme.calendar_season.should == :summer
      lexeme.season_style.should == :southern
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise season of precise year without hemisphere" do
      root = parser.parse('(fall) 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season
      lexeme.precision.should == :year
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise season without hemisphere" do
      root = parser.parse('(fall 1966 [ns])')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season
      lexeme.precision.should be_nil
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should == :ns
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a fractional calendar season" do

    it "parses a precise fractional season with hemispheric indication" do
      root = parser.parse('early fall 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season_fragment
      lexeme.precision.should == :season_fragment
      lexeme.fragment.should == :early
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise southern hemisphere fractional season" do
      root = parser.parse('late southern summer 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season_fragment
      lexeme.precision.should == :season_fragment
      lexeme.fragment.should == :late
      lexeme.calendar_season.should == :summer
      lexeme.season_style.should == :southern
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise season fragment of precise year w/o hemisphere" do
      root = parser.parse('(mid-fall) 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season_fragment
      lexeme.precision.should == :year
      lexeme.fragment.should == :mid
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise fractional season without hemisphere" do
      root = parser.parse('(mid-fall 1966 [ns])')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :season_fragment
      lexeme.precision.should be_nil
      lexeme.fragment.should == :mid
      lexeme.calendar_season.should == :autumn
      lexeme.season_style.should be_nil
      lexeme.year_number.should == 1966
      lexeme.year_style.should == :ns
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a calendar month" do

    it "parses a precise month" do
      root = parser.parse('november 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month
      lexeme.precision.should == :month
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise month of a precise year" do
      root = parser.parse('(november) 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month
      lexeme.precision.should == :year
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise month" do
      root = parser.parse('(november 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month
      lexeme.precision.should be_nil
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a fractional calendar month" do

    it "parses a precise fractional month" do
      root = parser.parse('early november 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month_fragment
      lexeme.precision.should == :month_fragment
      lexeme.fragment.should == :early
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise fractional month of a precise year" do
      root = parser.parse('(mid-november) 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month_fragment
      lexeme.precision.should == :year
      lexeme.fragment.should == :mid
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise fractional month" do
      root = parser.parse('(mid november 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :month_fragment
      lexeme.precision.should be_nil
      lexeme.fragment.should == :mid
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a calendar date" do

    it "parses a precise date" do
      root = parser.parse('november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :date
      lexeme.precision.should == :date
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise ordinal date" do
      root = parser.parse('november 6th 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :date
      lexeme.precision.should == :date
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise day of a precise month and year" do
      root = parser.parse('november (6), 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :date
      lexeme.precision.should == :month
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise day and month of a precise year" do
      root = parser.parse('(november 6th) 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :date
      lexeme.precision.should == :year
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise date" do
      root = parser.parse('(november 6th, 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :date
      lexeme.precision.should be_nil
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a date 'shift'" do

    it "parses a precise shift" do
      root = parser.parse('morning, november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift
      lexeme.precision.should == :shift
      lexeme.shift.should == :morning
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise shift of a precise date" do
      root = parser.parse('(night) november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift
      lexeme.precision.should == :date
      lexeme.shift.should == :night
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise shift" do
      root = parser.parse('(afternoon, november 6th, 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift
      lexeme.precision.should be_nil
      lexeme.shift.should == :afternoon
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a fractional date 'shift'" do

    it "parses a precise fractional shift" do
      root = parser.parse('early morning, november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift_fragment
      lexeme.precision.should == :shift_fragment
      lexeme.fragment.should == :early
      lexeme.shift.should == :morning
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise fractional shift of a precise date" do
      root = parser.parse('(late night) november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift_fragment
      lexeme.precision.should == :date
      lexeme.fragment.should == :late
      lexeme.shift.should == :night
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise fractional shift" do
      root = parser.parse('(mid-afternoon, november 6th, 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :shift_fragment
      lexeme.precision.should be_nil
      lexeme.fragment.should == :mid
      lexeme.shift.should == :afternoon
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

  context "parsing a date with time" do

    it "parses a precise date with time" do
      root = parser.parse('12:00 a.m., november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == :time
      lexeme.clock_time.should == '00:00:00'
      lexeme.time_zone.should be_nil
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise date with zoned time" do
      root = parser.parse('7:15a pst, november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == :time
      lexeme.clock_time.should == '07:15:00'
      lexeme.time_zone.should == :pst
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise date with military time" do
      root = parser.parse('23:59 u.t.c., november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == :time
      lexeme.clock_time.should == '23:59:00'
      lexeme.time_zone.should == :utc
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses a precise date with a named time" do
      root = parser.parse('noon, november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == :time
      lexeme.clock_time.should == '12:00:00'
      lexeme.time_zone.should be_nil
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise time on a precise date" do
      root = parser.parse('(4:00p -08:00) november 6, 1966')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == :date
      lexeme.clock_time.should == '16:00:00'
      lexeme.time_zone.should == :"-08:00" # ?
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

    it "parses an imprecise date with time" do
      root = parser.parse('(12p, november 6th, 1966)')
      root.elements.should have(1).node
      lexeme = root.elements[0]

      lexeme.scale.should == :time
      lexeme.precision.should == nil
      lexeme.clock_time.should == '12:00:00'
      lexeme.time_zone.should be_nil
      lexeme.month_day_index.should == 6
      lexeme.month_index.should == 11
      lexeme.year_number.should == 1966
      lexeme.year_style.should be_nil
      lexeme.year_era.should be_nil
    end

  end

end

