module Api
  module V1
    class SuggestedTopicsController < ApplicationController
      include ActionView::Helpers::SanitizeHelper

      protect_from_forgery with: :null_session

      def create
        render json: SuggestedTopic.create!(topic: sanitize(params[:suggested_topic][:topic]))
      end

      def index
        render json: SuggestedTopic.active.with_vote_counts
      end
    end
  end
end
