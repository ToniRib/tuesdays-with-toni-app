class ProgramMod < ApplicationRecord
  belongs_to :program
  belongs_to :mod
  has_many :lesson_recommendations
  has_many :recommended_lessons, through: :lesson_recommendations, source: 'lesson'
end
