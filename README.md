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
| password | string | null:false |
| password_confirmation | string | null:false |
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
| category | integer | null:false |
| status | integer | null:false |
| delivery_cost | integer | null:false |
| delivery_day | integer | null:false |
| price | integer | null:false |
## Association
* belongs_to :users
* has_one :orders

## ordersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | foreign_key:true |
| product | reference | foreign_key:true |
## Association
* has_one :addressbooks
* belong_to :users
* belong_to :items

## addressbooks
| Column | Type | Options |
| ------ | ---- | ------- |
| order | references | foreign_key:true |
| post_code | string | null:false |
| prefecture | integer | null:false |
| city | string | null:false |
| banti | string | null:false |
| bilding_name | string | |
| phone_num | string | null:false |
## Association
* belongs_to :orders