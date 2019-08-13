class Article < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :text, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true
  
end