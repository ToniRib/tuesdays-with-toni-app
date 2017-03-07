class Lesson < ApplicationRecord
  has_many :scheduled_lessons
  has_many :lesson_recommendations
  has_many :recommended_program_mods, through: 'lesson_recommendations', source: 'program_mod'

  def recommendations
    recommended_program_mods
      .joins(:program, :mod)
      .order("(programs.abbreviation||' '|| mods.name)")
      .pluck("(programs.abbreviation||' '|| mods.name)")
      .join(', ')
  end
end
