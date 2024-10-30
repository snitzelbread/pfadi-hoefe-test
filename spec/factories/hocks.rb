FactoryBot.define do
  factory :hock do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    datetime { Time.now }
    stufe { 'Rover' }
    ort { Faker::Address.city }
    leader
  end
end
