require 'rails_helper'

RSpec.describe V1::Web::UsersController, type: :controller do
  describe 'GET #index' do
    before :each do
      @params = { page: 1, per_page: 10 }
    end
    let(:user) { create_list(:user, 100) }

    context 'get all users' do

      it 'should return success' do
        get :index

        expect(response).to have_http_status(:success)
      end

      it 'should return correct pagination items' do
        total = user.count
        get :index, params: @params

        expect(response.body).to match total.to_s
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_user_attributes) { build(:user).attributes }

      it 'creates a new User' do
        expect {
          post :create, params: valid_user_attributes
        }.to change(User, :count).by(1)

      end
    end

    context 'with invalid params' do
      let(:invalid_user_attributes) { build(:user, password: nil).attributes }

      it 'creates a new invalid User' do
        post :create, params: invalid_user_attributes
        expect(response).to have_http_status(422)
      end
    end

    describe 'PUT #update' do
      context 'subscribe User to Program' do
        let(:program) { create(:program) }
        let(:user) { create(:user) }

        it 'should successfully subscribe user' do
          put :update, params: { id: user.id, subscribes_attributes: [{ program_id: program.id }] }
          expect(response).to have_http_status(:success)
        end

        it 'should return error when try to subscribe twice user' do
          put :update, params:
            { id: user.id, subscribes_attributes:
              [{ program_id: program.id }, { program_id: program.id }]
            }
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
