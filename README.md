# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_one  :shippings 

## items テーブル

| Column | Type    | Options     |
| ------ | ------  | ----------- |
| name   | string  | null:false  |
| text   | text    | null:false  |
| price  | integer | null:false  |

### Association

- belongs_to :users

## purchases テーブル

| Column | Type       | Options      |
| ------ | ---------- | ------------ |
| name   | string     | null: false, |
| text   | text       | null: false, |

### Association

- belongs_to :shippings
- belongs_to :user

## shippings テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ------------|
| address | string     | null:false  |      

### Association

- belongs_to :purchases
- belongs_to :user
