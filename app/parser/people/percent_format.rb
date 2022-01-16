module Parser
  module People
    require './app/parser/people/base.rb'

    class PercentFormat < Parser::People::Base
      private
      def delimiter
        '%'
      end
    end
  end
end