# ---------------------------------------------
# File generated automatically by ib_ruby_proxy
# ---------------------------------------------

module IbRubyProxy
  module Client
    module Ib
      PriceCondition = Struct.new(:price, :trigger_method, keyword_init: true) do
        def initialize(price: 0, trigger_method: 0)
          self.price = price
          self.trigger_method = trigger_method
        end

        def to_ib
          ib_object = Java::ComIbClient::PriceCondition.new
          ib_object.price(price).to_java
          ib_object.triggerMethod(trigger_method).to_java

          ib_object
        end
      end
    end
  end
end
