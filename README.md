## usersテーブル 必須

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

