require 'rails_helper'

RSpec.describe UpdateTickerJob, type: :job do
  it "Fetches tickers from  SEC" do
    UpdateTickerJob.perform_now
  end
end
