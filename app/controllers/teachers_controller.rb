class TeachersController < ApplicationController
  before_action :find_teacher, only: %i[edit update]
  before_action :build_teacher, only: %i[new create]

  def index
    @teachers = Teacher.all
  end

  def new; end

  def edit; end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path
      flash[:success] = 'Teacher Successfully Created'
    else
      render :new
      flash[:notice] = 'Teacher Not Create!'
    end
  end

  def update
    if @teacher.update_attributes(teacher_params)
      redirect_to teachers_path
      flash[:success] = 'Teacher Successfully Update'
    else
      render :edit
      flash[:notice] = 'Teacher Not Update!'
    end
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end

  def build_teacher
    @teacher = Teacher.new
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :middle_name, :last_name, :mother_name, :date_of_birth, :date_of_join, :gender, :aadhaar_card_number, :education, :speciality, :contact, :alternate_contact, :address, :is_active)
  end
end
