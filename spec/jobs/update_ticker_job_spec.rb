require 'rails_helper'

RSpec.describe UpdateTickerJob, type: :job do
  it "Should work with stubbed body" do
    body = <<~DOC
    aapl	320193
    msft	789019
    brk-b	1067983
    unh	731766
    jnj	200406
    v	1403161
    tsm	1046179
    DOC
    stub_request(:get, "https://www.sec.gov/include/ticker.txt")
      .to_return(status: 200, body:, headers: {})
    UpdateTickerJob.perform_now
  end

  it "Should work with stubbed body" do
    body = <<~DOC
    aapl	320193
    msft	789019
    brk-b	1067983
    DOC
    stub_request(:get, "https://www.sec.gov/include/ticker.txt")
      .to_return(status: 200, body:, headers: {})
    ticker_cik = create(:ticker_cik, ticker: "aapl", cik: "320193")
    expect{
      UpdateTickerJob.perform_now
    }.to change { TickerCik.count }.by(2)
    expect(TickerCik.count).to eq(3)
    expect(TickerCik.find_by(ticker: "msft").cik).to eq("789019")
  end
end
