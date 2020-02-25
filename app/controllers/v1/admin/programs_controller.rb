class V1::Admin::ProgramsController < V1::Web::ProgramsController
  # INFO: there must be some kind of authorization for the admin, but this is MVP,
  # we will add this in the next release
  private

  def program_params
    params.permit(:title, :description,
                  subscribes_attributes: %i[id user_id _destroy banned])
  end
end
