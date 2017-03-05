class CreateUserVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_votes do |t|
      t.references :user, foreign_key: true
      t.references :voted_lesson_topic, foreign_key: true

      t.timestamps
    end
  end
end
