# README

## テーブル設計

### users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| gender             | integer  | null: false               |
| encrypted_password | string   | null: false               |
| profile            | string   |                           |

#### Association

- has_many :posts
- has_many :comments

### posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| visit         | date       | null: false                    |
| restaurant    | string     | null: false                    |
| category      | integer    | null: false                    |
| private       | integer    | null: false                    |
| reserved      | integer    | null: false                    |
| open          | time       | null: false                    |
| close         | time       | null: false                    |
| address       | string     | null: false                    |
| budget        | integer    | null: false                    |
| introduction  | text       |                                |
| user          | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments

### comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| post     | references | null: false, foreign_key: true |

#### Association

- belongs_to :post
- belongs_to :user


<!-- This README would normally document whatever steps are necessary to get the
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

* ... -->
