module Parser
  module People
    class Payload
      require './app/constants/people.rb'
      include Constants::People::Payload

      attr_reader :params

      def initialize(params)
        @params = params
      end

      def order_by
        params[ORDER]
      end

      def dollar_format_params
        params[DOLLAR_FORMAT]
      end

      def percent_format_params
        params[PERCENT_FORMAT]
      end
    end
  end
end