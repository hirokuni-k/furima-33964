# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        |string  | null: false |
| first_name         |string  | null: false |
| family_name_kana   |string  | null: false |
| first_name_kana    |string  | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null:false  |
| price               | integer    | null:false  |
| condition_id        | integer    | null:false  |
| shipping_charge_id  | integer    | null:false  |
| shipping_area_id    | integer    | null:false  |
| shipping_date_id    | integer    | null:false  |
| category_id         | integer    | null:false  |
| shipping            | references | null:false  |
| user                | references | null:false  |

### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column | Type        | Options      |
| -------| ----------- | ------------ |
| user   | references  | null: false, |
| item   | references  | null: false, |

### Association

- belongs_to :user
- belongs_to :item

## shippings テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null:false  |
| post_code        | integer    | null:false  |
| prefecture       | string     | null:false  |
| city             | string     | null:false  |
| address          | string     | null:false  |
| building_name    | string     |             |
| phone_number     | integer    | null:false  |    

### Association

- belongs_to :user
