require 'rails_helper'

describe UserVote, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:user_vote)).to be_valid
    end
  end
end
