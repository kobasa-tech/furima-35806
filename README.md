# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | integer | null: false |

### Association
- has_many :items
- has_many :buys


## itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| description   | text       | null: false       |
| category      | string     | null: false       |
| item_status   | string     | null: false       |
| delivery_fee  | string     | null: false       |
| delivery_from | string     | null: false       |
| delivery_days | string     | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association
- has_one :buy
- belongs_to :user


## buysテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item


## Addressesテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | string     | null: false       |
| province     | string     | null: false       |
| city         | string     | null: false       |
| address_line | string     | null: false       |
| building     | string     |                   |
| phone_number | integer    | null: false       |
| buy          | references | foreign_key: true |

### Association
belongs_to :buy