module Api
  module V1
    class UserVotesController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        suggested_topic = SuggestedTopic.find_by(id: params[:suggested_topic][:id])
        user_vote = current_user.user_votes.new(suggested_topic: suggested_topic)

        if user_vote.save
          Rails.logger.info "Created user vote: { user: #{current_user.id}, topic: #{suggested_topic.id} }"

          render json: { new_vote_count: suggested_topic.reload.user_votes.count } , status: 201
        end
      end
    end
  end
end
