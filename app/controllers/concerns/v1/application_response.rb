module V1::ApplicationResponse
  extend ActiveSupport::Concern

  private

  def render_errors(object)
    render json: { errors: object.errors }, status: :unprocessable_entity
  end

  def render_created(object, serializer)
    render json: serializer.new(object), status: :created
  end

  def render_collection(object, serializer, options = {})
    render json: serializer.new(object, options), status: :ok
  end

  def render_with_options(object, serializer, options = {})
    render json: serializer.new(object, options), status: :ok
  end

  def render_object(object, serializer)
    render json: serializer.new(object)
  end

  def render_destroy
    render json: { message: 'Successfully removed' }, status: :ok
  end
end
