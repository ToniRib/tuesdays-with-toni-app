class Lesson < ApplicationRecord
  has_many :scheduled_dates, class_name: 'LessonDate'
  has_many :lesson_recommendations
  has_many :recommended_program_mods, through: 'lesson_recommendations', source: 'program_mod'
end
