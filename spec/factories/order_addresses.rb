FactoryBot.define do
  factory :order_address do
    prefecture_id      { '2' }
    postal_code { '123-4567' }
    municipalities { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011410806' }
    token {"tok_abcdefghijk00000000000000000"}




    association :user
    association :item
    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')

  end
end
