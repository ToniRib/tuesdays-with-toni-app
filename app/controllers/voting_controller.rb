class VotingController < ApplicationController
  def index
    @active_voted_lesson_topics = VotedLessonTopic.active.with_vote_counts
  end
end
