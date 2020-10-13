#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

client.req_historical_data(IbRubyProxy::Util::Id.call, Securities.emini,
                           "#{IbRubyProxy::Util.prior_friday} 17:00:00", '1 M', '1 day',
                           'TRADES', 1, 1, false, nil) do |_callback, _request_id, bar|
  ap bar
end

sleep
