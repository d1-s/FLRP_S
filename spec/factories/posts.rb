FactoryBot.define do
  factory :post do
    restaurant        { Faker::Lorem.sentence }
    visit             { '2021-10-04' }                           #Faker::Date.between(from: '2021-01-01', to: Date.today)
    category_id       { 2 }                                      # Faker::Number.within(range: 1..4)
    compartment_id    { 1 }                                      #Faker::Number.within(range: 1..2)
    reserved_id       { 1 }                                      #Faker::Number.within(range: 1..2)
    open              { 'Sat, 01 Jan 2000 10:00:00 JST +09:00' } # Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short)
    close             { 'Sat, 01 Jan 2000 19:00:00 JST +09:00' } # Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short)
    prefecture_id     { 13 }                                     # Faker::Number.within(range: 1..47)
    city              { Faker::Address.city }
    address           { Faker::Lorem.words(number: 1) }
    buiding           { Faker::Address.street_address }
    budget_id         { 2 }                                      # Faker::Number.within(range: 1..5)
    introduction      { Faker::Lorem.sentence }
    association :user

    after(:build) do |post|
      post.images.attach(io: File.open('app/assets/images/brick_1.jpg'), filename: 'brick_1.jpg')
    end

  end
end
