FactoryBot.define do
  factory :post do
    restaurant        { Faker::Lorem.sentence }
    visit             { Faker::Date.between(from: '2021-01-01', to: Date.today) }
    category_id       { Faker::Number.within(range: 1..4) }
    compartment_id    { Faker::Number.within(range: 1..2) }
    reserved_id       { Faker::Number.within(range: 1..2) }
    open              { Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short) }
    close             { Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short) }
    prefecture_id     { Faker::Number.within(range: 1..47) }
    city              { Faker::Address.city }
    address           { Faker::Lorem.words(number: 1) }
    buiding           { Faker::Address.street_address }
    budget_id         { Faker::Number.within(range: 1..5) }
    introduction      { Faker::Lorem.sentence }
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('app/assets/images/brick_1.jpg'), filename: 'brick_1.jpg')
    end

  end
end
