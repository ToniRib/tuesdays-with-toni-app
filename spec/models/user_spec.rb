require 'rails_helper'

describe User, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:user)).to be_valid
    end
  end
end
