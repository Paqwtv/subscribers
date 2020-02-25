require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { create(:user) }
  context 'with 2 or more programs' do
    let(:program1) { create(:program) }
    let(:program2) { create(:program) }
    it 'contains two programs' do
      user.programs << program1
      user.programs << program2
      expect(user.reload.programs).to eq([program1, program2])
    end
  end
  context 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end
  context 'ActiveRecord associations' do
    it { expect(user).to have_many(:subscribes) }
    it { expect(user).to have_many(:programs).through(:subscribes) }
    it { expect(user).to accept_nested_attributes_for(:subscribes) }
  end
  context 'validations' do
    it { expect(user).to allow_value('dhh@coolemail.com').for(:email) }
    it { expect(user).to_not allow_value('@foobar').for(:email) }
  end
end
