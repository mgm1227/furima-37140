FactoryBot.define do
  factory :order_orderhistory do
    user_id { 1 }
    item_id { 1 }
    post_cord { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    building_name {'東京ハイツ'}
    address { '1-1' }
    phone_number { '09012341234' }
  end
end
