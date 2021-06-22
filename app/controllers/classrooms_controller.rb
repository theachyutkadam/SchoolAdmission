class ClassroomsController < ApplicationController
  before_action :find_classroom, only: %i[edit update]
  before_action :build_classroom, only: %i[new create]

  def index
    @classrooms = Classroom.includes(:standard).all
  end

  def new; end

  def edit; end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to classrooms_path
      flash[:success] = 'Classroom Successfully Created'
    else
      render :new
      flash[:notice] = 'Classroom Not Create!'
    end
  end

  def update
    if @classroom.update_attributes(classroom_params)
      redirect_to classrooms_path
      flash[:success] = 'Classroom Successfully Update'
    else
      render :edit
      flash[:notice] = 'Classroom Not Update!'
    end
  end

  private

  def find_classroom
    @classroom = Classroom.find(params[:id])
  end

  def build_classroom
    @classroom = Classroom.new
  end

  def classroom_params
    params.require(:classroom).permit(:division, :medium, :intake, :teacher_id, :standard_id)
  end
end
