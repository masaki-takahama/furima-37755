FactoryBot.define do
  factory :user do
    nickname              { 'ぱぴこ' }
    email                 { Faker::Internet.free_email }
    password              { 'msaki1234' }
    password_confirmation { password }
    last_name             { '空条' }
    first_name            { '画太郎' }
    last_name_kana        { 'クウジョウ' }
    first_name_kana       { 'ガタロウ' }
    birthday              { Faker::Date.backward }
  end
end
