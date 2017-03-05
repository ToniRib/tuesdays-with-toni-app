require 'rails_helper'

describe ProgramMod, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:program_mod)).to be_valid
    end
  end
end
