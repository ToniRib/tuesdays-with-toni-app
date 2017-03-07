class VotedLessonTopic < ApplicationRecord
  has_many :user_votes
  has_many :users, through: :user_votes

  def self.archive_all!
    update_all(archived: true)
  end
end
