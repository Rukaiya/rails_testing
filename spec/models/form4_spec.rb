require 'rails_helper'

RSpec.describe Form4, type: :model do
  describe "#buy?" do
    it "correctly derives if it's a buy" do
      form4 = build(:form4, sum_shares: 1)
      expect(form4).to be_buy
    end
    it "knows if it's a sale" do
      form4 = build(:form4, sum_shares: -1)
      expect(form4).not_to be_buy
    end
  end

  describe "#leader?" do
    it "determines if the insider was a leader" do
      %w(CEO CFO Pres. CHIEF\ EXECUTIVE\ OFFICER CHIEF\ FINANCIAL\ OFFICER).each do |title|
        form4 = build(:form4, officer_title: title)
        expect(form4).to be_leader
      end
    end

    it "determines if the insider was not a leader" do
      %w(Director).each do |title|
        form4 = build(:form4, officer_title: title)
        expect(form4).not_to be_leader
      end
    end
  end

  it "has the right percent_change" do
    form4 = build(:form4, sum_shares: 50, sum_shares_after: 200 )
    expect(form4.percent_change).to eq(25.0)
  end

  describe "#notified?" do
    it "should only notify when buy, leader and percent_change > #{Form4::PERCENT_CHANGE_THRESHOLD}" do
      form4 = build(:form4, sum_shares: 50, sum_shares_after: 200,
                    officer_title: "CEO")
      expect(form4).to be_notified
    end

    it "should not notify when sale" do
      form4 = build(:form4, sum_shares: -50, sum_shares_after: 200,
                    officer_title: "CEO")
      expect(form4).not_to be_notified
    end
  end
end
