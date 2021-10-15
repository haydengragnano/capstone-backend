class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :user_tags
  has_many :tags, through: :user_tags
  belongs_to :game, optional: true
  
end
