class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :likes, dependent: :destroy
  
  validates :nickname, uniqueness: true, length: {maximum: 8 }, presence: true
  validates :email, uniqueness: true, presence: true
end
