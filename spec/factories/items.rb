FactoryBot.define do
  factory :item do
    item_name          {'あいue0'}
    item_price         { 1234567 }
    description        {Faker::Lorem.sentence}
    category_id        { 2 }
    detail_id          { 2 }
    shipping_cost_id   { 2 }
    prefecture_id      { 2 }
    day_to_ship_id     { 2 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/mei.png'), filename: 'mei.png')
    end
  end
end
