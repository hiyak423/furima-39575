FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials }
    first_name                { '大' }
    last_name                 { '山' }
    first_name_kana           { 'ダイ' }
    last_name_kana            { 'ヤマ' }
    birthday                  { Faker::Date.birthday }
    email                     { Faker::Internet.unique.email }
    password                  { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation     { password }
  end
end
