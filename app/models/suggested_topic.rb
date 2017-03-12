class SuggestedTopic < ApplicationRecord
  has_many :user_votes
  has_many :users, through: :user_votes

  scope :active, -> { where(archived: false) }

  def self.archive_all!
    update_all(archived: true)
  end

  def self.with_vote_counts
    select('suggested_topics.*, COUNT(user_votes.id) as vote_count')
      .joins(:user_votes)
      .group('suggested_topics.id')
      .order('vote_count DESC')
  end
end
