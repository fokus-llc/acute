
module Acute::Nodes

  class MonthDayNumberNode < Treetop::Runtime::SyntaxNode

    def value
      text_value.to_i
    end

  end

end

