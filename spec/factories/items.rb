FactoryBot.define do
  factory :item do
    name               { 'ダンベル' }
    explanation        { '重さはすごい' }
    price              { '15000' }
    # category           { Category.all.sample }
    # product_status     { ProductStatus.all.sample }
    # delivery_charge    { DeliveryCharge.all.sample }
    # prefecture         { Prefecture.all.sample }
    # shipping_date      { ShippingDate.all.sample }
    category_id        { '2' }
    product_status_id  { '2' }
    delivery_charge_id { '2' }
    prefecture_id      { '2' }
    shipping_date_id   { '2' }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
