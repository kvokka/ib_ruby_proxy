# ---------------------------------------------
# File generated automatically by ib_ruby_proxy
# ---------------------------------------------

java_import "com.ib.client.TimeCondition"

class Java::ComIbClient::TimeCondition
  def to_ruby
    ruby_object = IbRubyProxy::Client::Ib::TimeCondition.new
    ruby_object.time = time().to_ruby

    ruby_object
  end
end
