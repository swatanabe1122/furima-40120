# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| item_status_id      | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |

# orders テーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

# ShippingAddressテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| orders              | references | null: false, foreign_key: true |
| postcode            | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| block               | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |


# comments テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |
| text                | text        | null: false                    |
