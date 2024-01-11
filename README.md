# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
* has_many :items
* has_many :orders
* has_many :comments

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

### Association
* belongs_to :user
* has_one :order
* has_many :comments

# orders テーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :item
* has_one :shippingAddress


# ShippingAddres テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| postcode            | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| block               | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |

### Association
* belongs_to :order

# comments テーブル
| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |
| text                | text        | null: false                    |

### Association
* belongs_to :user
* belongs_to :item