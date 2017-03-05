class VotedLessonTopic < ApplicationRecord
  has_many :user_votes
  has_many :users, through: :user_votes
end
