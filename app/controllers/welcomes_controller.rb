class WelcomesController < ApplicationController
  def index
    user = User.find params[:user]
    @user_login = user.role.name
    if user.role.name == "Headmaster"
      headmaster_dashboard
    elsif user.role.name == "Teacher"
      teacher_dashboard
    else user.role.name == "Student"
      student_dashboard
    end
  end

  def student_dashboard
    puts "****************"
    puts "Student"
    puts "****************"
  end

  def teacher_dashboard
    puts "****************"
    puts "Teacher"
    puts "****************"
  end

  def headmaster_dashboard
    puts "****************"
    puts "Headmaster"
    puts "****************"
  end

end