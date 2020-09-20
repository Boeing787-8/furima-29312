FactoryBot.define do
  factory :item do
    
    name               {"亜あア"}
    explanation        {"亜あア"}
    category_id        {3}
    condition_id       {3}
    delivery_fee_id    {3}
    prefecture_from_id {3}
    shipping_day_id    {3}
    price              {"300"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    association :user
  end
end