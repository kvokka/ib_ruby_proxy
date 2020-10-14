module IbRubyProxy
  module Util
    module Id
      module_function

      # Generate intra day uniq integer, generation will leak after 10**9 of
      # combinations, but it's acceptable
      def call
        return @order_id.increment if @order_id

        @order_id = Concurrent::AtomicFixnum.new((Time.now.to_f * 10_000).to_i % 2**30)
        @order_id.increment
      end
    end
  end
end
