class WelcomesController < ApplicationController
  def index
    @current_user_role = current_user.login_type
    if @current_user_role == 'Headmaster'
      @teachers = Teacher.all
      @students = Student.all
    elsif @current_user_role == 'Teacher'
      @students = Teacher.find(current_user.login_id).classroom.students.includes(:standard)
    else @current_user_role == 'Student'
    end
  end
end
