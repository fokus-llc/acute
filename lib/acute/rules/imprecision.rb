# Autogenerated from a Treetop grammar. Edits may be lost.



require 'acute/rules/imprecise/calendar_year'
require 'acute/rules/imprecise/seasons'
require 'acute/rules/imprecise/months'
require 'acute/rules/imprecise/dates'
require 'acute/rules/imprecise/date_shifts'
require 'acute/rules/imprecise/date_times'

module Acute::Rules
  module Imprecision
    include Treetop::Runtime

    include Acute::Rules::Imprecise::CalendarYear

    include Acute::Rules::Imprecise::Seasons

    include Acute::Rules::Imprecise::Months

    include Acute::Rules::Imprecise::Dates

    include Acute::Rules::Imprecise::DateShifts

    include Acute::Rules::Imprecise::DateTimes

  end

  class ImprecisionParser < Treetop::Runtime::CompiledParser
    include Imprecision
  end

end

