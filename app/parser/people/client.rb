module Parser
  module People
    class Client
      require './app/parser/people/payload.rb'
      require './app/parser/people/order.rb'
      require './app/parser/people/dollar_format.rb'
      require './app/parser/people/percent_format.rb'

      attr_reader :payload

      def initialize(params)
        @payload = Parser::People::Payload.new(params)
        @records = []
      end

      def parse
        order 
        return @records.map(&:format)
      end

      private
      def dollar_formatted_records
        return [] if payload.dollar_format_params.nil?
        @dollar_formated_records = Parser::People::DollarFormat.new(payload.dollar_format_params).parse
      end

      def percent_formated_records
        return [] if payload.percent_format_params.nil?
        @percent_formated_records = Parser::People::PercentFormat.new(payload.percent_format_params).parse
      end

      def order
        return unless payload.order_by
        @records = Parser::People::Order.new(records, payload.order_by).order
      end

      def records
        @records = dollar_formatted_records + percent_formated_records
      end
    end
  end
end