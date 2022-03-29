FactoryBot.define do
  factory :order_orderhistory do
    token { 'tok_abcdefghijk00000000000000000' }
    post_cord { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    building_name { '東京ハイツ' }
    address { '1-1' }
    phone_number { '01234567890' }
  end
end
