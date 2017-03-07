require 'rails_helper'

describe Lesson, type: :model do
  subject { build(:lesson) }

  describe 'factory' do
    it 'is valid by default' do
      expect(subject).to be_valid
    end
  end

  describe '#recommendations' do
    before { subject.save! }

    context 'when there are no recommended program mods' do
      it 'returns an empty string' do
        expect(subject.recommendations).to eq ''
      end
    end

    context 'when there are recommended program mods' do
      let(:backend_program) { create(:program, name: 'Backend Engineering', abbreviation: 'BEE') }
      let(:frontend_program) { create(:program, name: 'Frontend Engineering', abbreviation: 'FEE') }
      let(:mod1) { create(:mod, name: 'mod1') }
      let(:mod2) { create(:mod, name: 'mod2') }
      let(:backend_mod1) { create(:program_mod, program: backend_program, mod: mod1) }
      let(:frontend_mod2) { create(:program_mod, program: frontend_program, mod: mod2) }

      before { subject.recommended_program_mods << [backend_mod1, frontend_mod2] }

      it 'returns a string with comma separated recommendations in alphabetical order' do
        expect(subject.recommendations).to eq 'BEE mod1, FEE mod2'
      end
    end
  end
end
