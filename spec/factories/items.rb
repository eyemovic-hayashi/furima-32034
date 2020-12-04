FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    from_area_id { 2 }
    delivery_day_id { 2 }
    price { Faker::Commerce.price(range: 300..10_000).to_i }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
