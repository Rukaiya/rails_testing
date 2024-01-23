FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user.#{n}@ra.dev"}
  end
end
