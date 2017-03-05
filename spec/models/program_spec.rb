require 'rails_helper'

describe Program, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:program)).to be_valid
    end
  end
end
