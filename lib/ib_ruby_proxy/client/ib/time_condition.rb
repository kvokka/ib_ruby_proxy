# ---------------------------------------------
# File generated automatically by ib_ruby_proxy
# ---------------------------------------------

module IbRubyProxy
  module Client
    module Ib
      TimeCondition = Struct.new(:time, keyword_init: true) do
        def initialize(time: nil)
          self.time = time
        end

        def to_ib
          ib_object = Java::ComIbClient::TimeCondition.new
          ib_object.time(time).to_java

          ib_object
        end
      end
    end
  end
end
