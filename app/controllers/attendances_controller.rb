class AttendancesController < ApplicationController
  before_action :find_attendance, only: %i[edit update]
  before_action :build_attendance, only: %i[new create]
  def index
    @attendances = Attendance.all
  end

  def new;end


  def edit;end

  private

  def find_attendance
    @attendance = Attendance.find(params[:id])
  end

  def build_attendance
    @attendance = Attendance.new
  end

end
