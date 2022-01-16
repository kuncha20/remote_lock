module Parser
  module People
    require './app/parser/people/base.rb'

    class DollarFormat < Parser::People::Base
      private
      def delimiter
        '$'
      end
    end
  end
end