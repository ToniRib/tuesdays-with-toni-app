class ScheduledLesson < ApplicationRecord
  belongs_to :lesson

  delegate :recommendations, to: :lesson

  def self.upcoming
    select(<<-SQL.squish)
        scheduled_lessons.scheduled_date, 
        scheduled_lessons.id, 
        lessons.id as lesson_id, 
        lessons.name, 
        lessons.description
      SQL
      .joins(:lesson)
      .where('scheduled_date >= ?', Date.today.beginning_of_day)
      .order('scheduled_date ASC')
  end
end
