FactoryBot.define do
  factory :bestellung do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    zipcode { Faker::Address.zip_code }
    message { Faker::Lorem.paragraph }
  end
end
