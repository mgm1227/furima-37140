# テーブル設計

## usersテーブル

| Colum              | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| name               | text   | null: false               |
| name_kana          | text   | null: false               |
| birthday           | time   | null: false               |


## itemsテーブル

| Colum            | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| item_name        | text       | null: false                    |
| category         | string     | null: false                    |
| detail           | string     | null: false                    |
| description      | string     | null: false                    |
| shipping_cost    | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| daystoship       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


## ordersテーブル

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| post_cord       | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address         | integer    | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
