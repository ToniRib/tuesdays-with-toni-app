class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :voted_lesson_topic
end
