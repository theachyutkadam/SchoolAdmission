class ApplicationController < ActionController::Base
  before_action :authenticate_user

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, :alert => exception.message }
    end
  end

  def authenticate_user
    current_user = User.find_by_id(cookies[:user_id])
    redirect_to root_path if current_user.nil?
  end

  def current_user
    current_user = User.find_by_id(cookies[:user_id])
  end
end
