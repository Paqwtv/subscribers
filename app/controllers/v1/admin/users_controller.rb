class V1::Admin::UsersController < V1::Web::UsersController
  # INFO: there must be some kind of authorization for the admin, but this is MVP,
  # we will add this in the next release
  private

  def user_params
    params.permit(:email, :name, :password,
                  subscribes_attributes: %i[id program_id _destroy banned])
  end
end
