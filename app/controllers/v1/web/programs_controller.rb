class V1::Web::ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :update, :destroy]

  def index
    programs = Program.includes(:users).paginate(page: params[:page], per_page: params[:per_page])
    render_collection(programs, V1::Web::ProgramSerializer, pagination_options(programs))
  end

  def show
    render_with_options(@program, V1::Web::ProgramSerializer, params: { relations: true })
  end

  def create
    program = Program.new(program_params)

    if program.save
      render_created(program, V1::Web::ProgramSerializer)
    else
      render_errors(program)
    end
  end

  def update
    if @program.update(program_params)
      render_with_options(@program,  V1::Web::ProgramSerializer, params: { relations: true })
    else
      render_errors(@program)
    end
  end

  def destroy
    @program.destroy
    render_destroy
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.permit(:title, :description,
                  subscribes_attributes: %i[id user_id _destroy])
  end
end
