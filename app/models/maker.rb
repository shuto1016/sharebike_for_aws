class Maker < ApplicationRecord
  has_many :articles_makers
  has_many :articles, through: :articles_makers
end
