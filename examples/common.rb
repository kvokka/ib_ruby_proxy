require 'drb'
require 'ib_ruby_proxy'
require 'amazing_print'
require 'date'

# borrowed from https://stackoverflow.com/questions/43149326/ruby-rails-get-the-previous-friday-friday-of-last-week
module Utils
  module_function

  def prior_friday(date = nil)
    date ||= Date.today
    days_before = (date.wday + 1) % 7 + 1
    (date - days_before).strftime('%Y%m%d')
  end
end

class Securities
  class << self
    def emini
      expiration_month = (Date.today + 60).strftime('%Y%m')
      IbRubyProxy::Client::Ib::Contract.new symbol: 'ES',
                                            sec_type: 'FUT',
                                            currency: 'USD',
                                            exchange: 'GLOBEX',
                                            last_trade_date_or_contract_month: expiration_month
    end
  end
end
