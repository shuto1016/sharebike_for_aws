class Displacement < ApplicationRecord
  has_many :articles_displacements
  has_many :articles, through: :articles_displacements
end
