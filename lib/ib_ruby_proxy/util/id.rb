module IbRubyProxy
  module Util
    module Id
      module_function

      # Generate intra day uniq integer
      def call
        @order_id = (@order_id || (Time.now.to_f * 10_000).to_i % 2**30) + 1
      end
    end
  end
end
