require 'rails_helper'

describe Mod, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:mod)).to be_valid
    end
  end
end
