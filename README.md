# README

# アプリケーション名
フリマアプリ


# アプリケーション概要
ユーザー登録を行い、商品の出品、購入ができます。

商品はトップページ下部に表示にされ、売却済みの商品はsoldoutが表示されます。


# URL
### URL (AWS EC2によるデプロイ)  
* http://52.197.62.88
### Basic認証  
* ID: admin  
* Pass: 0423

# テスト用アカウント
### 出品者用
* メールアドレス: furima2@imail.com
* パスワード: furima2

### 購入者用
* メールアドレス: furima1@imail.com
* パスワード: furima1
### 購入用カード情報
* 番号：4242424242424242
* 期限：12/24 月/年
* セキュリティコード：123

# ご利用方法
### 商品の閲覧
* ユーザー登録を行わなくても、商品の閲覧が可能です。商品は、トップページ下部に表示されています。
* 商品画像をクリックすると、商品の詳細を閲覧できます。
[![Image from Gyazo](https://i.gyazo.com/2acf235d1b2e4fc5f2db0e15f344fbc8.gif)](https://gyazo.com/2acf235d1b2e4fc5f2db0e15f344fbc8)
  
### ユーザー登録
* トップページ上部右にある「新規登録」ページにて、ユーザー登録ができます。
* 過去に新規登録済みのユーザーは、「ログイン」ページにて、ログインができます。
  [![Image from Gyazo](https://i.gyazo.com/ec164bed0ea4cf5985e259a463db0232.gif)](https://gyazo.com/ec164bed0ea4cf5985e259a463db0232)
  





### 商品を出品する
* トップページ右下にある「出品する」のロゴをクリックすると、出品ページに移動します。
* 商品情報を漏れなく入力することで、商品を出品できます。



### 出品中の商品を編集、削除する
* 出品者は出品中の商品に限り、商品の詳細画面から編集・削除ができます。*削除の取り消しは出来ません。
* すでに売却済みの商品は、編集・削除を行うことができません。（各ボタンが非表示になります）

* 
* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル
| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| nickname           | string              | null:false                   |
| first_name         | string              | null:false                   |
| last_name          | string              | null:false                   |
| first_name_kana    | string              | null:false                   |
| last_name_kana     | string              | null:false                   |
| birthday           | date                | null:false                   |
| encrypted_password | string              | null:false                   |
| email              | string              | null:false unique: true      |
### Association
  has_many :items
  has_many :orders

## items テーブル
| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| name               | string              | null:false                   |
| description        | text                | null:false                   |
| category_id        | integer             | null:false                   |
| status_id          | integer             | null:false                   |
| shipping_cost_id   | integer             | null:false                   |
| prefecture_id      | integer             | null:false                   |
| shipping_day_id    | integer             | null:false                   |
| price              | integer             | null:false                   |
| user               | references          | null:false foreign_key: true |
### Association
  has_one :order
  belongs_to :user 

## orders テーブル
| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| user               | references          | null:false foreign_key: true |
| item               | references          | null:false foreign_key: true |
### Association
has_one :shipping
belongs_to :item
belongs_to :user

## shippings テーブル
| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| postcode           | string              | null:false                   |
| prefecture_id      | integer             | null:false                   |
| city               | string              | null:false                   |
| block              | string              | null:false                   |
| building           | string              |                              |
| phone_number       | string              | null:false                   |
| order              | references          | null:false foreign_key: true |
### Association
belongs_to :order
