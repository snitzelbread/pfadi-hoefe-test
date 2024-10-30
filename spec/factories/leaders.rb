FactoryBot.define do
  factory :leader do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    stufe { Faker::Lorem.word }
    funktion { Faker::Lorem.word }
    pfadiname { Faker::Name.first_name + Faker::Name.last_name }
  end
end
