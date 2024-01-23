class UpdateTickerJob < ApplicationJob
  queue_as :default

  def perform
    mapping = RestClient
                .get("https://www.sec.gov/include/ticker.txt")
                .body
                .split("\n")
                .map {|pair| pair.split("\t")}

    mapping.each do |(ticker, cik)|
      TickerCik.find_or_create_by!(ticker: ticker, cik: cik)
    end
  end
end
