require 'rails_helper'

RSpec.describe Program, type: :model do
  context 'with 2 or more users' do
    let(:program) { create(:program) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    it 'contains two programs' do
      program.users << user1
      program.users << user2
      expect(program.reload.users).to eq([user1, user2])
    end
  end
end
