#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

promise = Concurrent::Promises.resolvable_future.tap do |future|
  id = IbRubyProxy::Util::Id.call
  client.req_contract_details(id, Securities.emini) do |_callback, _req_id, contract_details|
    future.fulfill(contract_details)
  end
end

puts 'Before callback fired'
ap promise.value
puts 'After callback fired'
