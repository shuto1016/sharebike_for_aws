## Sharebike
https://blog-miniapp.herokuapp.com/　　
自分のバイク情報を共有し、検索もできるSNSです。

テスト用アカウント　　
メールアドレス: test@test.com　　
パスワード: 111111　　

## 機能と使用技術
* ユーザー機能
  * ログイン機能(devise)
* 記事機能
  * 新規投稿機能
  * 複数画像投稿機能(carrerwave,mini_magick)
  * 詳細表示機能
  * 一覧表示機能(ページネーション)
  * 編集・削除機能
* いいね機能
 * Ajax通信によるいいね機能
 * いいね一覧機能
* レスポンシブ対応(CSSフレームワーク：Materialize)

## テスト
 * RSpec
  * 単体テスト機能
  * 統合テスト機能

## 開発環境
* 言語(Ruby 2.3.1)
* フレームワーク(Rails 5.2.1)
* データベース(MySQL)
* 開発(VSCode)

## 本番環境
* heroku
* 画像ストレージ(Amazon S3)

# * DB設計

## usersテーブル 

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null:false, unique:true|
|password|string|null:false| 

### Association
- has_many :articles, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|text|text|null:false|
|name|string|null:false, index: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :likes, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|references|null: false, foreign_key:true|
|images|string|null: false|

### Association
-  belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|parent_id|integer||

### Association
- has_many :products,


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :article
-  belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|article_id|references|null: false, foreign_key:true|
|comment|text|null: false|

### Association
-  belongs_to :article
-  belongs_to :user

