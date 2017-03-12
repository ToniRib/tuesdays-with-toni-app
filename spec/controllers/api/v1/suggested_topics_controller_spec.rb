require 'rails_helper'

module Api
  module V1
    describe SuggestedTopicsController, type: :controller do
      describe '#create' do
        let(:user) { create(:user) }
        let(:topic_name) { "<script>alert('TopicName')</script>" }
        let(:sanitized_topic_name) { "alert('TopicName')" }
        let(:params) do
          {
            suggested_topic: {
              name: topic_name
            }
          }
        end

        before do
          allow_any_instance_of(ApplicationController)
            .to receive(:current_user)
            .and_return(user)
        end

        it 'sanitizes the topic name' do
          post :create, params: params

          expect(SuggestedTopic.last.name).to eq sanitized_topic_name
        end

        context 'when the topic saves successfully' do
          it 'returns a 201 status' do
            post :create, params: params

            expect(response.status).to eq 201
          end

          it 'creates a UserVote' do
            expect { post :create, params: params }.to change { UserVote.count }.by 1
          end

          it 'returns the new suggested topic' do
            post :create, params: params

            expect(response.body).to eq SuggestedTopic.last.to_json
          end
        end

        context 'when the topic does not save successfully' do
          let(:topic_name) { nil }

          it 'returns a 400 status' do
            post :create, params: params

            expect(response.status).to eq 400
          end

          it 'does not create a UserVote' do
            expect { post :create, params: params }.not_to change { UserVote.count }
          end

          it 'returns an error message' do
            post :create, params: params

            expect(response.body).to eq({ error: ["Name can't be blank"] }.to_json)
          end
        end
      end
    end
  end
end
