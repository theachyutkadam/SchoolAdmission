class AttendancesController < ApplicationController
  before_action :find_attendance, only: %i[edit update]
  before_action :build_attendance, only: %i[new create]
  def index
    @attendances = Attendance.all
  end

  def new;end

  def edit;end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to attendances_path
      flash[:success] = 'Attendance Create Successfully'
    else
      render :edit
      flash[:notice] = 'Attendance Not Create'
    end
  end

  def update
    if @attendance.update_attributes(attendance_params)
      redirect_to attendances_path
      flash[:success] = 'Attendance Update Successfully'
    else
      render :edit
      flash[:notice] = 'Attendance Not Update'
    end
  end

  private

  def find_attendance
    @attendance = Attendance.find(params[:id])
  end

  def build_attendance
    @attendance = Attendance.new
  end

  def attendance_params
    params.require(:attendance).permit(:is_present, :student_id, :teacher_id)
  end


end
