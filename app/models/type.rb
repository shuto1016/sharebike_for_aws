class Type < ApplicationRecord
  has_many :articles_types
  has_many :articles, through: :articles_types
end
