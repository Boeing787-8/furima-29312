# テーブル設計

## users テーブル

| Column              | Type   | Options      |
| ------------------- | ------ | ------------ |
| user_name           | string | null: false  |
| email               | string | null: false  |
| password            | string | null: false  |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_one :address
- has_many :items
- has_many :comments
- has_many :images

## items テーブル

| Column           | Type        | Options                       |
| ---------------- | ----------- | ----------------------------- |
| images           | references  | null: false,foreign_key: true |
| name             | string      | null: false                   |
| explanation      | text        | null: false                   |
| category         | integer     | null: false                   |
| condition        | integer     | null: false                   |
| delivery_fee     | integer     | null: false                   |
| prefecture_from  | integer     | null: false                   |
| shipping_day     | integer     | null: false                   |
| price            | integer     | null: false                   |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | string     | null: false |
| prefecture       | integer    | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |

### Association

- belongs_to :user

## credit_card テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| card_number   | integer    | null: false |
| expiry_month  | integer    | null: false |
| expiry_year   | integer    | null: false |
| security_code | integer    | null: false |

### Association

- belongs_to :user