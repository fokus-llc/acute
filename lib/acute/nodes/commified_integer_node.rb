
module Acute::Nodes

  class CommifiedIntegerNode < Treetop::Runtime::SyntaxNode

    def to_i
      text_value.gsub(',', '').to_i
    end

    def value
      to_i
    end

  end

end

