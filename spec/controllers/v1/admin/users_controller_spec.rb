require 'rails_helper'

RSpec.describe V1::Admin::UsersController, type: :controller do

  describe 'PUT #update' do
    context 'subscribe User to Program' do
      let(:program) { create(:program, users: create_list(:user, 10)) }
      let(:user) { program.users.sample }

      it 'should successfully blocked subscribed user' do
        put :update, params:
          { id: user.id,
            subscribes_attributes:
              [{ id: user.subscribes.first.id, _destroy: 1 }]
          }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
