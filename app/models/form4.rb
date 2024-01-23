class Form4 < ApplicationRecord
  PERCENT_CHANGE_THRESHOLD = 10
  belongs_to :company
  belongs_to :insider

  def notified?
    buy? && leader? && percent_change > PERCENT_CHANGE_THRESHOLD && percent_change < 100
  end

  def percent_change
    sum_shares.fdiv(sum_shares_after) * 100
  end
  def leader?
    !(officer_title =~ /CEO|CFO|Pres.|CHIEF EXECUTIVE OFFICER|CHIEF FINANCIAL OFFICER/i).nil?
  end
  def buy?
    sum_shares > 0
  end
end
