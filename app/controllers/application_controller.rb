class ApplicationController < ActionController::API
  # INFO: there must be some kind of authorization for the users, but this is MVP,
  # we will add this in the next release
  include V1::ApplicationResponse
  include ::Pagination

  rescue_from ActiveRecord::RecordNotUnique do |exception|
    render json: { message: exception }, status: :unprocessable_entity
  end
end
