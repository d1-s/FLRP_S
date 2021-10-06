FactoryBot.define do
  factory :user do
    name                    { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    gender                  { Faker::Number.within(range: 0..1) }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    profile                 { Faker::Lorem.sentence }
  end
end
