#!/usr/bin/env ruby

require_relative './common'

client = IbRubyProxy::Client::Client.from_drb

result = client.req_contract_details(IbRubyProxy::Util::Id.call,
                                     Securities.emini) do |_callback, _request_id, contract_details|
  contract_details
end
puts 'Before callback fired'
ap result

# rubocop:disable Style/RedundantBegin
begin
  sleep(0.001)
  print('.')
end while !result.done
# rubocop:enable Style/RedundantBegin
puts

puts 'After callback fired'
ap result
