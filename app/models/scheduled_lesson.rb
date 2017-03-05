class ScheduledLesson < ApplicationRecord
  belongs_to :lesson

  def self.upcoming
    select(<<-SQL.squish)
        scheduled_lessons.scheduled_date, 
        scheduled_lessons.id, 
        lessons.id as lesson_id, 
        lessons.name, 
        lessons.description
      SQL
      .joins(:lesson)
      .where('scheduled_date >= ?', Date.today)
      .order('scheduled_date ASC')
  end
end
