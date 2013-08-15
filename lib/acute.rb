
module Acute

  def self.parse(text, options = {})
    GrammarParser.new.parse(text, options)
  end

end

require 'acute/grammar'

