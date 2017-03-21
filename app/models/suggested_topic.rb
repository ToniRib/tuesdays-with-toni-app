class SuggestedTopic < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :archived, case_sensitive: false }, on: :create

  has_many :user_votes
  has_many :users, through: :user_votes

  scope :active, -> { where(archived: false) }

  def self.archive_all!
    update_all(archived: true)
  end

  def self.with_voting(user_id)
    select(voting_select_statement(user_id))
      .joins(:user_votes)
      .group('suggested_topics.id')
      .order('vote_count DESC')
  end

  def self.voting_select_statement(user_id)
    if user_id
      <<-SQL.squish
        suggested_topics.*,
        COUNT(user_votes.id) AS vote_count, 
        CASE 
          WHEN EXISTS (
            SELECT 1 
              FROM user_votes 
              WHERE user_votes.user_id = #{user_id} 
              AND suggested_topic_id = suggested_topics.id
          ) THEN FALSE
          ELSE true 
        END AS voting_allowed
      SQL
    else
      <<-SQL.squish
        suggested_topics.*, 
        COUNT(user_votes.id) AS vote_count, 
        false AS voting_allowed
      SQL
    end
  end
end
