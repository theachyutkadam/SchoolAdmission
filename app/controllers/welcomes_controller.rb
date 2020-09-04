class WelcomesController < ApplicationController
  def index
    @current_user_role = current_user.role.name
    if @current_user_role == "Headmaster"
      headmaster_dashboard
    elsif @current_user_role == "Teacher"
      teacher_dashboard
    else @current_user_role == "Student"
      student_dashboard
    end
  end

  def student_dashboard
    puts "****************"
    puts "Student"
    puts "****************"
  end

  def teacher_dashboard
    @student =Student.all
  end

  def headmaster_dashboard
    puts "****************"
    puts "Headmaster"
    puts "****************"
  end
end