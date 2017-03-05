class RenameLessonDatesToScheduledLessons < ActiveRecord::Migration[5.0]
  def up
    rename_table :lesson_dates, :scheduled_lessons
  end

  def down
    rename_table :scheduled_lessons, :lesson_dates
  end
end
