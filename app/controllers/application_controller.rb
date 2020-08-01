class ApplicationController < ActionController::Base
  before_action :authenticate_user

  def authenticate_user
    current_user = User.find_by_id(cookies[:user_id])
    if current_user.nil?
      redirect_to root_path
    end
  end
end