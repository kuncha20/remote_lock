module Parser
  module People
    class Order
      attr_reader :records, :order_by

      def initialize(records, order_by)
        @records = records
        @order_by = order_by
      end

      def order
        send("#{order_by}_order")
        return @records
      end

      private
      def first_name_order
        @records = records.sort_by(&:first_name)
      end
    end
  end
end