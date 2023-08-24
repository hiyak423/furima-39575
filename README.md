# README

# アプリケーション名
フリマアプリ


# アプリケーション概要
ユーザー登録を行い、商品の出品、購入ができます。

商品はトップページ下部に表示にされ、売却済みの際はsoldoutが表示されます。


# URL・Basic認証  
### AWS EC2を利用
* http://52.197.62.88
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
* 期限：12/24
* セキュリティコード：123

# ご利用方法
### 商品の閲覧
* ユーザー登録を行わなくても、商品の閲覧が可能です。商品は、出品日時が新しいものから表示しています。
* 商品画像をクリックすると、商品の詳細を閲覧できます。
### ![op6HXzIus4wJQ7xFQnF51692685304-1692685318](https://github.com/hiyak423/furima-39575/assets/138428189/91e8e5a7-694a-4a16-b08a-1086bc276fc9)


### ユーザー登録
* トップページ上部右にある「新規登録」ページにて、ユーザー登録ができます。
* 過去に登録済みのユーザーは、「ログイン」ページにて、ログインができます。
### ![w0KwxzEW13MaQykKNAk41692685608-1692685623](https://github.com/hiyak423/furima-39575/assets/138428189/f03442e0-338d-42b6-bdcd-24baf5749ba1)
  

### 商品を出品する
* トップページ右下にある「出品する」のロゴをクリックすると、出品ページに移動します。
* 商品情報を漏れなく入力後、ページ最下部にある「出品する」をクリックすると、商品を出品できます。
### ![iOBYY1jdWelGKtZ3Yi0Q1692685731-1692685751](https://github.com/hiyak423/furima-39575/assets/138428189/cf51efde-f8be-495d-98fa-68b9b4a9b92f)


### 出品中の商品を編集、削除する
* 商品の詳細画面から「編集」をクリックすると、編集ページに移動し、商品情報を更新できます。
* 商品の詳細画面から「削除」をクリックすると、商品の削除ができます。
* 編集・削除は、出品者本人のみが行えます。売却済みの場合は、アクセス不可になります。
### ![Cw7gsGwAkDX2g0K0mb1J1692685235-1692685253](https://github.com/hiyak423/furima-39575/assets/138428189/c6144a65-d619-49e4-b600-edf6aa3a439d)


### 出品中の商品を購入する
* ログイン中のユーザーは、商品の詳細画面から購入ページへ移動し、必要事項を入力後、購入ができます。
### ![i4MNT1rOA59GJa1SFGRd1692684982-1692685000](https://github.com/hiyak423/furima-39575/assets/138428189/c566fdf5-fc7c-4d55-941d-44125b75f863)


# ER図
![furima-39575 ER図_230801](https://github.com/hiyak423/furima-39575/assets/138428189/6d43bc10-b0f9-46cf-a4cf-90b897892577)

# テーブル設計
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


# 開発環境
* Ruby 3.2.0
* rails 7.0.6
* mysql2 0.5.5
  

# ローカルでの動作方法(git clone)
以下コマンドを実行する  
```ruby
% git clone https://github.com/hiyak423/furima-39575.git　
% cd furima-39575　　
% bundle install　　
% rails db:create　　
% rails db:migrate　　
```
