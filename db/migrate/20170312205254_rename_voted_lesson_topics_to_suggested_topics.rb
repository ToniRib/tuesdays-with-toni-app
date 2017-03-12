class RenameVotedLessonTopicsToSuggestedTopics < ActiveRecord::Migration[5.0]
  def up
    rename_table :voted_lesson_topics, :suggested_topics
    rename_column :user_votes, :voted_lesson_topic_id, :suggested_topic_id
  end

  def down
    rename_table :suggested_topics, :voted_lesson_topics
    rename_column :user_votes, :suggested_topic_id, :voted_lesson_topic_id
  end
end
