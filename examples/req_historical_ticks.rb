#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

result = []
client.req_historical_ticks(IbRubyProxy::Util::Id.call, Securities.emini, nil,
                            "#{Utils.prior_friday} 17:00:00", 10,
                            'MIDPOINT', 1, false, nil) do |_callback, _request_id, ticks, _done|
  result += ticks
end

sleep(0.0001) until result.size >= 10

ap result
# ap r

sleep 0.3
