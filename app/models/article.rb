class Article < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :text, presence: true
  accepts_nested_attributes_for :images
  
end