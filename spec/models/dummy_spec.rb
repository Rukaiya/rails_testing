require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it "must have an age greater than 21" do
    dummy = create(:dummy)
    dummy2 = create(:dummy)
    expect(dummy.email).to eq("hello+1@ra.dev")
    expect(dummy2.email).to eq("hello+2@ra.dev")
  end
end
