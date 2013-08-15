
module Acute::Nodes

  class IntegerNode < Treetop::Runtime::SyntaxNode

    def to_i
      text_value.to_i
    end

    def value
      to_i
    end

  end

end

