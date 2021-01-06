# テーブル設計

## usersテーブル


| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| date               | date | null: false   |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column       | Type       | Options                       |
| ------       | ---------- | -------------                 |
| text         | text       | null: false                   |
| category_id  | integer    | null: false                   |
| state_id     | integer    | null: false                   |
| price        | integer    | null: false                   |
| delivery_id  | integer    | null: false                   |
| area_id      | integer    | null: false                   |
| days_id      | integer    | null: false                   |
| item_name    | string     | null: false                   |
| user_id      | references | null: false,foreign_key :true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column        | Type           | Options                         |
| -------       | ----------     | ------------------------------- |
| user_id       | references     | null: false,foreign_key :true   |
| item_id       | references     | null: false,foreign_key :true   |




### Association

- belongs_to :user
- belongs_to :item
- has_one :address

### addressテーブル
| Column            | Type       | Options                        |
| -------           | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefectures       | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                   
| telephone_number  | string     | null: false                    |

### Association

- belongs_to :purchase
