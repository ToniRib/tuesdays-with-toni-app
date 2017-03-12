module Api
  module V1
    class LessonTopicsController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        respond_with VotedLessonTopic.active.with_vote_counts
      end
    end
  end
end
