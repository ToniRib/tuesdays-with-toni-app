class CreateLessonDates < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_dates do |t|
      t.references :lesson, foreign_key: true
      t.datetime :scheduled_date

      t.timestamps
    end
  end
end
