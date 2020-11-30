## 下記オプション一覧
## null: false カラムが殻の状態では保存できない
## unique: true 一意性のみ許可（同じ値は保存できない）
## foreign_key; true 外部キーの設定（別テーブルのカラム参照）

 Usersテーブル
| Column                | Type        | Options                     |
-----------------------------------------------------
| nickname              | string      | null: false                 |
| email                 | string      | null: false, unique: true   |
| encrypted_password    | string      | null: false                 |
| first_name            | string      | null: false                 |
| last_name             | string      | null: false                 |
| first_name_kana       | string      | null: false                 |
| last_name_kana        | string      | null: false                 |
| birthday              | date        | null: false                 |

 Association
has_many :items
has_many :purchases

 Itemsテーブル
| Column        | Type        | Options                                   |
-----------------------------------------------------
| user                     | string      | null: false, foreign_key: true |
| name                     | string      | null: false                    |
| explanation              | text        | null: false                    |
| price                    | integer     | null: false                    |
| category_address_id      | integer     | null: false                    |
| status_address_id        | integer     | null: false                    |
| delivery_fee_address_id  | integer     | null: false                    |
| from_area_address_id     | integer     | null: false                    |
| delivery_days_address_id | integer     | null: false                    |

 Association
belongs_to :user
has_one :purchase

 Purchasesテーブル
| Column      | Type        | Options                        |
-----------------------------------------------------
| user        | string      | null: false, foreign_key: true |
| item        | string      | null: false, foreign_key: true |

 Association
belongs_to :user
belongs_to :item
has_one :address

 Addressesテーブル
| Column                | Type         | Options               |
-----------------------------------------------------
| purchase              | string      | null: false, foreign_key: true |
| prefecture_address_id | integer     | null: false                    |
| post_number           | string      | null: false                    |
| municipalities        | string      | null: false                    |
| address_number        | string      | null: false                    |
| building_name         | string      |                                |
| phone_number          | string      | null: false                    |

 Association
belongs_to :purchase