# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | email  | null: false |
| encrypted_password  | string | null: false |
| fist_name           | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday_year       | date   | null: false |
| birthday_month      | date   | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | blob       | null: false                    |
| name                | string     | null: false                    |
| explanation         | textarea   | null: false                    |
| category            | string     | null: false                    |
| product_status      | string     | null: false                    |
| delivery_charge     | int        | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_date       | date       | null: false                    |
| price               | int        | null: false                    |
| user                | references | null: false, foreign_key: true |
### Association

- has_many   :comments
- has_one    :purchase
- belongs_to :user

## purchasesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_namber      | int        | null: false,                   |
| expiration_month | date       | null: false                    |
| expiration_year  | date       | null: false                    |
| security_code    | int        | null: false                    |
| post_code        | int        | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_number    | int        | null: false                    |
| phone_number     | phone      | null: false                    |
| items_price      | int        | null: false                    |
| user             | references | null: false, foreign_key: true |
| room             | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


