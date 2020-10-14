module IbRubyProxy
  module Util
    module Id
      module_function

      # Generate intra day uniq integer
      def call
        return @order_id.increment if @order_id

        @order_id = Concurrent::AtomicFixnum.new((Time.now.to_f * 10_000).to_i % 2**30)
      end
    end
  end
end
