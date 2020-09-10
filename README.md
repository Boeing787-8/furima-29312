# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| user_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_one :profile
- has_one :credit_card
- has_one :address
- has_many :items
- has_many :comments
- has_many :images

## profile テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |

### Association

- belongs_to :users

## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| images           | references | null: false,foreign_key: true |
| item_name        | string     | null: false                   |
| item_explanation | text       | null: false                   |
| category         | references | null: false,foreign_key: true |
| condition        | references | null: false,foreign_key: true |
| delivery_fee     | references | null: false,foreign_key: true |
| prefecture_from  | string     | null: false                   |
| price            | integer    | null: false                   |

### Association

- has_many :comments
- has_many :images
- belongs_to :users

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| image   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | integer    | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| house_number     | integer    | null: false |
| building_name    | string     |             |
| telephone_number | integer    | null: false |

### Association

- belongs_to :users

## credit_card テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| card_number   | integer    | null: false |
| expiry_month  | integer    | null: false |
| expiry_year   | integer    | null: false |
| security_code | integer    | null: false |

### Association

- belongs_to :users