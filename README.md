# テーブル設計

## usersテーブル


| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_many :purchase
- has_many :address



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
- belongs_to :purchase
- belongs_to :address

## purchase テーブル

| Column        | Type       | Options                         |
| -------       | ---------- | ------------------------------- |
| purchase_name | string     | null: false                    |

### Association

- belongs_to :user
- has_many :items
- has_one :address

### addressテーブル
| Column            | Type       | Options                        |
| -------           | ---------- | ------------------------------ |
| address           | string     | null: false                    |
| telephone＿number  | string    | null: false                     |

### Association

- belongs_to :user
- has_many :items
- belongs_to :purchase
