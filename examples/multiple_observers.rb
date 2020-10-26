#!/usr/bin/env ruby

require_relative './common'

class CallbacksObserver < IbRubyProxy::Client::IbCallbacksObserver
  def historical_data(*args)
    ap args
  end

  def historical_data_end(*); end
end

class RequestsObserver
  include DRb::DRbUndumped

  def self.processed
    @processed ||= []
  end

  ProcessedRequest = Struct.new(:req_id, :callback, :time, keyword_init: true)

  def update(callback, req_id = nil, *_args)
    pq = ProcessedRequest.new(req_id: req_id, callback: callback.to_sym, time: Time.now)
    self.class.processed << pq
  end
end

aapl = IbRubyProxy::Client::Ib::Contract.new symbol: 'AAPL',
                                             sec_type: 'STK',
                                             exchange: 'NYSE'

client = IbRubyProxy::Client::Client.from_drb
client.add_ib_callbacks_observer CallbacksObserver.new
client.add_ib_callbacks_observer RequestsObserver.new

requests_count = (ARGV.first || 1).to_i

requests_count.times do |i|
  client.req_historical_data(IbRubyProxy::Util::Id.call,
                             aapl,
                             "#{IbRubyProxy::Util.prior_friday} 15:#{i}0:00",
                             '25 D',
                             '5 mins',
                             'TRADES',
                             1,
                             1,
                             false,
                             nil)
end

t = Time.now

sleep(0.001) until RequestsObserver
                   .processed
                   .select { |o| o.callback == :historical_data_end }
                   .size == requests_count

puts "Processed #{RequestsObserver.processed.size} bars, it took #{(Time.now - t).to_f}"
