FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    date { Time.now }
  end
end
