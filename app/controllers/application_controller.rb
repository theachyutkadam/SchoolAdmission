class ApplicationController < ActionController::Base
  # before_action :authenticate_user

  def authenticate_user

    user_id = request.headers["X-AUTH-TOKEN"]
    # current_user = User.find_by_id(cookies[:user_id])

    current_user = User.find_by_id(user_id)

    redirect_to root_path if current_user.nil?
  end

  def current_user
    current_user = User.find_by_id(cookies[:user_id])
  end
end
