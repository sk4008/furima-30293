# テーブル設計

## usersテーブル


| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| first_name         | string | null: false |
| last_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| date               | string | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column    | Type       | Options       |
| ------    | ---------- | --------------|
| text      | text       | null: false  |
| image     | string     | null: false  |
| category  | string     | null: false  |
| state     | string     | null: false  |
| price     | integer    | null: false  |
| delivery  | string     | null: false  |
| area      | string     | null: false  |
| days      | date       | null: false  |
| item_name | text       | null: false  |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column        | Type       | Options                         |
| -------       | ---------- | ------------------------------- |
| purchase_name | string     | null: false,foreign_key         |

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

- belongs_to :user
- has_many :items
- belongs_to :purchase
