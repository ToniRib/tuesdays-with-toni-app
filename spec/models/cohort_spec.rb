require 'rails_helper'

describe Cohort, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:cohort)).to be_valid
    end
  end
end
