class UserVote < ApplicationRecord
  belongs_to :user
  belongs_to :suggested_topic
end
