class User < ApplicationRecord
  enum gender: { female: 0, male: 1, others: 2}

  after_commit :create_stripe_customer, on: :create

  private

  def create_stripe_customer
    CreateStripeCustomerJob.perform_later(id)
  end
end
