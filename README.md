## 下記オプション一覧
## null: false カラムが殻の状態では保存できない
## unique: true 一意性のみ許可（同じ値は保存できない）
## foreign_key; true 外部キーの設定（別テーブルのカラム参照）

 Usersテーブル
| Column      | Type        | Options                   |
-----------------------------------------------------
| nickname    | string      | null: false               |
| email       | string        | null: false, unique: true |
| password    | string      | null: false               |
| first_name  | string      | null: false               |
| last_name   | string      | null: false               |
| birthday    | integer     | null: false               |

 Association
has_many :items
has_many :purchases
has_one :address

 Itemsテーブル
| Column        | Type        | Options                   |
-----------------------------------------------------
| name          | string      | null: false               |
| image         | string      | null: false               |
| explanation   | text        | null: false               |
| price         | integer     | null: false               |
| category      | string      | null: false               |
| status        | string      | null: false               |
| delivery_fee  | integer     | null: false               |
| from_area     | string      | null: false               |
| delivery_days | integer     | null: false               |

 Association
belongs_to :user
has_many :addresses
has_one :purchase

 Purchasesテーブル
| Column      | Type        | Options                   |
-----------------------------------------------------
| user_name   | string      | null: false               |
| when        | string      | null: false               |
| item_name   | string      | null: false               |

 Association
belongs_to :user
has_one :item

 Addressesテーブル
| Column      | Type        | Options                   |
-----------------------------------------------------
| prefecture     | string      | null: false            |
| post_number    | string      | null: false            |
| municipalities | string      | null: false            |
| building_name  | string      |                        |
| phone_number   | integer     | null: false            |

 Association
belongs_to :item
has_one :user