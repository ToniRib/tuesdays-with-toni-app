class UpcomingLessonsController < ApplicationController
  def index
    @upcoming_lessons = ScheduledLesson.upcoming
  end
end
