# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| fist_name           | string | null: false               |
| last_name           | string | null: false               |
| first_name_kana     | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :purchases



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |ActiveHash
| product_status_id   | integer    | null: false                    |ActiveHash
| delivery_charge_id  | integer    | null: false                    |ActiveHash
| prefecture_id       | integer    | null: false                    |ActiveHash
| shipping_date_id    | integer    | null: false                    |ActiveHash
| user                | references | null: false, foreign_key: true |

### Association
- has_many   :comments
- has_one    :purchase
- belongs_to :user
- belongs_to :category_activehash
- belongs_to :product_status_activehash
- belongs_to :delivery_charge_activehash
- belongs_to :prefectures_activehash
- belongs_to :shipping_date_activehash



## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_info



## shipping_infos テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |ActiveHash
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :prefectures_activehash



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user



