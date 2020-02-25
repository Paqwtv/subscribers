class V1::Web::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.includes(:programs).paginate(page: params[:page], per_page: params[:per_page])
    render_collection(users, V1::Web::UserSerializer, pagination_options(users))
  end

  def show
    render_with_options(@user, V1::Web::UserSerializer,  params: { relations: true })
  end

  def create
    user = User.new(user_params)

    if user.save
      render_created(user, V1::Web::UserSerializer)
    else
      render_errors(user)
    end
  end

  def update
    if @user.update(user_params)
      render_with_options(@user, V1::Web::UserSerializer, params: { relations: true })
    else
      render_errors(@user)
    end
  end

  def destroy
    @user.destroy
    render_destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :name, :password,
                  subscribes_attributes: %i[id program_id _destroy])
  end
end
