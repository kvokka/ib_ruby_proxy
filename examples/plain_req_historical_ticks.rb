#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

class CallbacksObserver < IbRubyProxy::Client::IbCallbacksObserver
  def historical_ticks(_request_id, ticks, _done)
    ap ticks
  end
end

aapl = IbRubyProxy::Client::Ib::Contract.new symbol: 'AAPL',
                                             sec_type: 'STK',
                                             exchange: 'ISLAND'

client.add_ib_callbacks_observer CallbacksObserver.new
client.req_historical_ticks(IbRubyProxy::Util::Id.call, aapl,
                            "#{IbRubyProxy::Util.prior_friday} 12:00:00",
                            nil, 100, 'MIDPOINT', 1, false, nil)

sleep
