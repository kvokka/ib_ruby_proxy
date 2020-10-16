# ---------------------------------------------
# File generated automatically by ib_ruby_proxy
# ---------------------------------------------

module IbRubyProxy
  module Client
    module Ib
      OrderState = Struct.new(:status, :init_margin_before, :maint_margin_before, :equity_with_loan_before, :init_margin_change, :maint_margin_change, :equity_with_loan_change, :init_margin_after, :maint_margin_after, :equity_with_loan_after, :commission, :min_commission, :max_commission, :commission_currency, :warning_text, :completed_time, :completed_status, keyword_init: true) do
        def initialize(status: nil, init_margin_before: nil, maint_margin_before: nil, equity_with_loan_before: nil, init_margin_change: nil, maint_margin_change: nil, equity_with_loan_change: nil, init_margin_after: nil, maint_margin_after: nil, equity_with_loan_after: nil, commission: 0, min_commission: 0, max_commission: 0, commission_currency: nil, warning_text: nil, completed_time: nil, completed_status: nil)
          self.status = status
          self.init_margin_before = init_margin_before
          self.maint_margin_before = maint_margin_before
          self.equity_with_loan_before = equity_with_loan_before
          self.init_margin_change = init_margin_change
          self.maint_margin_change = maint_margin_change
          self.equity_with_loan_change = equity_with_loan_change
          self.init_margin_after = init_margin_after
          self.maint_margin_after = maint_margin_after
          self.equity_with_loan_after = equity_with_loan_after
          self.commission = commission
          self.min_commission = min_commission
          self.max_commission = max_commission
          self.commission_currency = commission_currency
          self.warning_text = warning_text
          self.completed_time = completed_time
          self.completed_status = completed_status
        end

        def to_ib
          ib_object = Java::ComIbClient::OrderState.new
          ib_object.status(status).to_java
          ib_object.initMarginBefore(init_margin_before).to_java
          ib_object.maintMarginBefore(maint_margin_before).to_java
          ib_object.equityWithLoanBefore(equity_with_loan_before).to_java
          ib_object.initMarginChange(init_margin_change).to_java
          ib_object.maintMarginChange(maint_margin_change).to_java
          ib_object.equityWithLoanChange(equity_with_loan_change).to_java
          ib_object.initMarginAfter(init_margin_after).to_java
          ib_object.maintMarginAfter(maint_margin_after).to_java
          ib_object.equityWithLoanAfter(equity_with_loan_after).to_java
          ib_object.commission(commission).to_java
          ib_object.minCommission(min_commission).to_java
          ib_object.maxCommission(max_commission).to_java
          ib_object.commissionCurrency(commission_currency).to_java
          ib_object.warningText(warning_text).to_java
          ib_object.completedTime(completed_time).to_java
          ib_object.completedStatus(completed_status).to_java

          ib_object
        end
      end
    end
  end
end
