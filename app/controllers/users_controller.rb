class UsersController < ApplicationController
  def login
    is_valid = User.authenticate params[:username], params[:password]
    if is_valid
      redirect_to Something_path
    else
      flash[:error] = "invalid credentials"
      render :new
    end
  end
end
