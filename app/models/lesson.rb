class Lesson < ApplicationRecord
  has_many :scheduled_lessons
  has_many :lesson_recommendations
  has_many :recommended_program_mods, through: 'lesson_recommendations', source: 'program_mod'
end
