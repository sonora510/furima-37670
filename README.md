# テーブル情報
* ユーザー情報:users
* 商品出品:items
* 購入管理:orders
* 発送先住所:address_books

# テーブル設計
## usersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| nickname | string | null:false |
| email | string | null:false unique:true |
| encrypted_password | string | null:false |
| family_name_zen | string | null:false |
| first_name_zen | string | null:false |
| family_name_kana | string | null:false |
| first_name_kana | string | null:false |
| birthday | date | null:false |
## Association
* has_many:orders
* has_many:items

## itemsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | foreign_key:true |
| product | string | null: false |
| information | text | null:false |
| prefecture_id | integer | null:false |
| category_id | integer | null:false |
| status_id | integer | null:false |
| delivery_cost_id | integer | null:false |
| delivery_day_id | integer | null:false ||
| price | integer | null:false |
## Association
* belongs_to :user
* has_one :order

## ordersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | foreign_key:true |
| product | reference | foreign_key:true |
## Association
* has_one :addressbook
* belong_to :user
* belong_to :item

## addressbooks
| Column | Type | Options |
| ------ | ---- | ------- |
| order_id | references | foreign_key:true |
| post_code_id | string | null:false |
| prefecture_id | integer | null:false |
| city | string | null:false |
| banti | string | null:false |
| bilding_name | string | |
| phone_num | string | null:false |
## Association
* belongs_to :order