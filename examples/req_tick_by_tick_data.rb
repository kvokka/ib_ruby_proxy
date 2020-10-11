#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

client.req_tick_by_tick_data(IbRubyProxy::Util::Id.call, Securities.emini,
                             'Last', 0, false) do |*arguments|
  ap arguments
end

sleep
