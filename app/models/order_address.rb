class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :street_number, :building_name, :phone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :street_number
    validates :phone_number, length: { in: 10..11 }, numericality: {only_integer: true, message: 'is invalid'}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    @address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    
  end

end
