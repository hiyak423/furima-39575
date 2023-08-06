FactoryBot.define do
  factory :item do
    name               { Faker::Name.initials }
    description        { '商品の説明' }
    category_id        { 2 }
    status_id          { 2 }
    shipping_cost_id   { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    price              { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
