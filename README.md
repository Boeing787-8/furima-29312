# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ------------|
| name                | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| explanation      | text        | null: false                    |
| category         | integer     | null: false                    |
| condition        | integer     | null: false                    |
| delivery_fee     | integer     | null: false, foreign_key: true |
| prefecture_from  | integer     | null: false, foreign_key: true |
| shipping_day     | integer     | null: false, foreign_key: true |
| price            | integer     | null: false, foreign_key: true |
| user             | references  | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address