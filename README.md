# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## table_name
Column          Type    Options

## users
nickname        string  null:false
first_name      string  null:false
last_name       string  null:false
first_name_kana string  null:false
last_name_kana  string  null:false
birth_year      integer null:false
birth_month     integer null:false
birth_day       integer null:false

## items
name           string   null:false
description    text     null:false
category       integer  null:false
status         integer  null:false
shipping_cost  integer  null:false
shipping_area  integer  null:false
shipping_day   integer  null:false
price          integer  null:false
user_id        references null:false foreign_key: true

### Association
has_one order, belongs_to user

## orders
user_id        references null:false foreign_key: true
item_id        references null:false foreign_key: true
### Association
has_one order, belongs_to user

## shippings
postcode       string   null:false
prefecture     integer  null:false
city           string   null:false
block          string   null:false
building       string   
phone_number   string   null:false
order_id       references null:false foreign_key: true
### Association
belongs_to order
