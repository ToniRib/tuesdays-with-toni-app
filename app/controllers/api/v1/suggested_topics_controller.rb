module Api
  module V1
    class SuggestedTopicsController < ApplicationController
      include ActionView::Helpers::SanitizeHelper

      protect_from_forgery with: :null_session

      def create
        suggested_topic = SuggestedTopic.new(topic: sanitize(params[:suggested_topic][:topic]))

        if suggested_topic.save
          suggested_topic.user_votes.create!(user: current_user)

          render json: suggested_topic, status: 201
        else
          render json: { error: 'Could not save topic' }, status: 400
        end
      end

      def index
        render json: SuggestedTopic.active.with_vote_counts
      end
    end
  end
end
