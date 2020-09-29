class WelcomesController < ApplicationController
  def index
    @current_user_role = current_user.login_type
    if @current_user_role == 'Headmaster'
      @teachers = Teacher.all
      @students = Student.all
    elsif @current_user_role == 'Teacher'
      teacher = Teacher.find(current_user.login_id)
      @students = teacher.classroom.students
      @current_user_name = "#{teacher.first_name + ' ' + teacher.last_name}"
    else @current_user_role == 'Student'
      student = Student.find(current_user.login_id)
      @current_user_name = "#{student.first_name + ' ' + student.last_name}"
    end
  end
end
