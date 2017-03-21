module Api
  module V1
    class SuggestedTopicsController < ApplicationController
      include ActionView::Helpers::SanitizeHelper

      protect_from_forgery with: :null_session

      def create
        suggested_topic = SuggestedTopic.new(name: sanitize(params[:suggested_topic][:name]))

        if suggested_topic.save
          suggested_topic.user_votes.create!(user: current_user)

          render json: suggested_topic, status: 201
        else
          render json: { error: suggested_topic.errors.full_messages }, status: 400
        end
      end

      def index
        render json: SuggestedTopic.active.with_voting(current_user&.id)
      end
    end
  end
end
