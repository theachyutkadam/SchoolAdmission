class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def new
    redirect_to welcomes_index_path if current_user.present?
  end

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

  def logout
    cookies.delete(:user_id)
    redirect_to root_url
  end
end
