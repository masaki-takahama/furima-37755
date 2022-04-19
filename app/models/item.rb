class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
  end

  validates :price, presence: { message: '半角数字で記入してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true,
                            message: '範囲は¥300~¥9,999,999の間です' }
  validates :image, presence: { message: '画像が必要です' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :product_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date
end
