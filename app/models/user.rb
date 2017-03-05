class User < ApplicationRecord
  has_secure_password

  belongs_to :cohort
  has_many :user_votes
  has_many :voted_lesson_topics, through: :user_votes
end
