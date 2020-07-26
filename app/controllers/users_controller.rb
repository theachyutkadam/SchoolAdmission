class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def new;end

  def login
    user = User.authenticate params[:login][:username], params[:login][:password]
    if user
      cookies[:user_id] = user.id
      redirect_to welcomes_index_path
      flash[:notice] = "Successfully Log In."
    else
      render :new, status: 401
      flash.alert = "invalid credentials"
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to root_url
  end
end
