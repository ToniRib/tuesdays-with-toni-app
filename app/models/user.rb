class User < ApplicationRecord
  has_secure_password

  belongs_to :cohort
  has_many :user_votes
  has_many :suggested_topics, through: :user_votes

  validates :username, uniqueness: true, length: { minimum: 6 }
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8 }
end
