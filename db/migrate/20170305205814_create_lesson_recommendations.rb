class CreateLessonRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_recommendations do |t|
      t.references :lesson, foreign_key: true
      t.references :program_mod, foreign_key: true

      t.timestamps
    end
  end
end
