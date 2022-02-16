# テーブル設計

## usersテーブル

| Colum              | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_first         | string | null: false               |
| name_family        | string | null: false               |
| name_first_kana    | string | null: false               |
| name_family_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many   :items
- has_many   :orders



## itemsテーブル

| Colum            | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string     | null: false                    |
| item_price       | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| detail_id        | integer    | null: false                    |
| description      | text       | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| day_to_ship_id   | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :order

## ordersテーブル

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to  :item
- has_one     :order_history

## order_histories

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| post_cord       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association
- belongs_to  :order

