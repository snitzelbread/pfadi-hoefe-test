FactoryBot.define do
  factory :sponsor do
    name { Faker::Company.name }
    linky { Faker::Internet.url }
  end
end
