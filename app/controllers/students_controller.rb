class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update destroy]
  before_action :build_student, only: %i[new create]

  def index
    @students = Student.all
  end

  def new; end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
      flash[:success] = 'Student Successfully Created'
    else
      render :new
      flash[:notice] = 'Student Not Create!'
    end
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to students_path
      flash[:success] = 'Student Successfully Update'
    else
      render :edit
      flash[:notice] = 'Student Not Update!'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
    flash[:success] = 'Student Successfully delete'
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def build_student
    @student = Student.new
  end

  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :mother_name, :gender, :date_of_birth, :aadhaar_card_number, :standard_id, :classroom_id, :town, :is_handicap, :handicap_details, :is_active)
  end
end
