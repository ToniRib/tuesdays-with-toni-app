class LessonRecommendation < ApplicationRecord
  belongs_to :lesson
  belongs_to :program_mod
end
