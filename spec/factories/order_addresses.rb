FactoryBot.define do
  factory :order_address do
    
    post_code { '123-4567' }
    prefecture_from_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '12345678900' }
    token {"aaa"}
  end
end
