class VotingController < ApplicationController
  def index
    session[:forwarding_url] = request.url

    @active_voted_lesson_topics = VotedLessonTopic.active.with_vote_counts
  end
end
