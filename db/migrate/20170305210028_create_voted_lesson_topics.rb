class CreateVotedLessonTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :voted_lesson_topics do |t|
      t.string :topic, null: false
      t.integer :vote_count, default: 0
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
