require 'rails_helper'

RSpec.describe V1::Web::ProgramsController, type: :controller do
  describe 'GET #index' do
    before :each do
      @params = { page: 1, per_page: 10 }
    end
    let(:program) { create_list(:program, 100) }

    context 'get all Programs' do

      it 'should return success' do
        get :index

        expect(response).to have_http_status(:success)
      end

      it 'should return correct pagination items' do
        total = program.count
        get :index, params: @params

        expect(response.body).to match total.to_s
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_program_attributes) { build(:program).attributes }

      it 'creates a new User' do
        expect {
          post :create, params: valid_program_attributes
        }.to change(Program, :count).by(1)

      end
    end

    describe 'PUT #update' do
      context 'subscribe Program to User' do
        let(:program) { create(:program) }
        let(:user) { create(:user) }

        it 'should successfully subscribe user' do
          put :update, params: { id: program.id, subscribes_attributes: [{ user_id: user.id }] }
          expect(response).to have_http_status(:success)
        end

        it 'should return error when try to subscribe twice user' do
          put :update, params:
            { id: program.id, subscribes_attributes:
              [{ user_id: user.id }, { user_id: user.id }]
            }
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
