require 'rails_helper'

describe Lesson, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:lesson)).to be_valid
    end
  end
end
