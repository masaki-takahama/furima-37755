class Item < ApplicationRecord
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :price,              presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で記入してください' }
  validates :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999 , message: "範囲は¥300~¥9,999,999の間です"}
  validates :image,              presence: { message: '画像が必要です' }
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id,   numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_date
end


