FactoryBot.define do
  factory :company do
    sequence(:cik) {|n| "CIK-#{n}"}
  end
end
