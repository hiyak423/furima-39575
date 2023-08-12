FactoryBot.define do
  factory :order_shipping do
    user_id          { Faker::Number.between(from: 1, to: 50) }
    item_id          { Faker::Number.between(from: 1, to: 50) }
    postcode         { Faker::Number.unique.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    city             { Faker::Address.city }
    block            { Faker::Address.street_address }
    building         { Faker::Address.secondary_address }
    phone_number     { Faker::Number.number(digits: 11) }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end