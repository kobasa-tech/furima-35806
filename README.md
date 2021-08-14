# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| item_status_id   | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| province_id      | integer    | null: false       |
| delivery_days_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- has_one :order
- belongs_to :user


## ordersテーブル

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
| province_id  | integer    | null: false       |
| city         | string     | null: false       |
| address_line | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| order        | references | foreign_key: true |

### Association
belongs_to :order