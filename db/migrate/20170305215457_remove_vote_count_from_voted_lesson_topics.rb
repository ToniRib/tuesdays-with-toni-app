class RemoveVoteCountFromVotedLessonTopics < ActiveRecord::Migration[5.0]
  def change
    remove_column :voted_lesson_topics, :vote_count
  end
end
