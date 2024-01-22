 FactoryBot.define do
  factory :dummy do
    name { "MyString" }
    age { 21 }
    sequence(:email) { |n| "hello+#{n}@ra.dev"}
  end
end
