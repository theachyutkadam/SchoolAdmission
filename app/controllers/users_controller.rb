class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def new; end

  def login
    user = User.authenticate params[:login][:username], params[:login][:password]
    if user
      cookies[:user_id] = user.id
      flash[:success] = 'Successfully Login.'
      redirect_to welcomes_index_path
    else
      flash.now[:error] = 'Login Field'
      render :new, status: 401
    end
  end

  def sign_up
    puts "--------------------"
    puts "--------------------"
    puts params
    puts "--------------------"
    puts "--------------------"
    user = User.find_by(username: params[:email])
    if user.present?
      cookies[:user_id] = user.id
      flash[:success] = 'Successfully Login.'
      redirect_to welcomes_index_path
      # redirect_to edit_student_path(@student)
    else
      @student = Student.new
      @student.first_name = params[:email]
      @student.first_name = params[:email]
      @student.standard_id = 1
      @student.classroom_id = 1
      @student.save(:validation=> false)
      user = @student.user
      cookies[:user_id] = user.id
      flash[:success] = 'Successfully Login.'
      # redirect_to welcomes_index_path
      redirect_to edit_student_path(@student)
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to root_url
  end
end
