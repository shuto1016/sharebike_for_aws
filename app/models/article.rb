class Article < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :text, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true

  def liked? (liked_user_id, liked_article_id)
    likes.where(user_id: liked_user_id, article_id: liked_article_id).exists?
   end  
end