# テーブル設計

## usersテーブル

| Colum              | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_first         | string | null: false               |
| name_family        | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many   :item
- has_one    :order
- has_many   :order_history


## itemsテーブル

| Colum            | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order
- belongs_to_active_hash :item_genre
- belongs_to :order_history


## items_genre

| Colum            | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| category_id      | integer    | null: false                    |
| detail_id        | integer    | null: false                    |
| description      | text       | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| daystoship_id    | integer    | null: false                    |

### Association
- belongs_to :item



## ordersテーブル

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to  :item
- has_many    :order_history

## order_history

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| post_cord       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | integer    | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| order           | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- has_many    :items
- belongs_to  :order

