FactoryBot.define do
  factory :item do
    name               { Faker::Name.initials }
    description        { '商品の説明' }
    category_id        { rand(2..11) }
    status_id          { rand(2..7) }
    shipping_cost_id   { rand(2..3) }
    prefecture_id      { rand(2..48) }
    shipping_day_id    { rand(2..4) }
    price              { 9_999_999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
