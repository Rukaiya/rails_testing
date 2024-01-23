require 'rails_helper'

RSpec.describe CreateStripeCustomerJob, type: :job do
  it "enqueues the job as expected" do
    allow(
      Stripe::Customer
    ).to receive(:create).and_return(
      Stripe::Customer.new(id: "cus_test")
    )

    user = create(:user)
    expect {
      CreateStripeCustomerJob.perform_later(user.id)
    }.to have_enqueued_job(CreateStripeCustomerJob)
  end

  it "creates a stripe customer and saves its id" do
    allow(
      Stripe::Customer
    ).to receive(:create).and_return(
      Stripe::Customer.new(id: "cus_test")
    )

    user = create(:user)
    CreateStripeCustomerJob.perform_now(user.id)
    user.reload
    expect(user.stripe_customer_id).to eq("cus_test")
  end
end
