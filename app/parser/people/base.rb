module Parser
  module People
    class Base
      require './app/people/record.rb'

      attr_reader :params

      def initialize(params)
        @params = clean_and_transform(params)
      end

      def records
        @records = rows.map do |row|
          ::People::Record.new(row)
        end
      end

      protected
      def delimiter
        
      end

      private
      def clean_and_transform(params)
        params.split("\n").map { |row| row.split(delimiter).map(&:strip) }
      end
      
      def rows
        @rows ||= params[1..-1].map(&headers.method(:zip)).map(&:to_h)
      end

      def headers
        params.first
      end
    end
  end
end