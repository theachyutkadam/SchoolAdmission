class Api::V1::UsersController < Api::V1::BaseController
  # skip_before_action :authenticate_user
  def new; end

  def login
    puts  "==========="
    puts  "==========="
    puts  "==========="
    puts params
    puts  "==========="
    puts  "==========="
    binding.pry
    user = User.authenticate params[:users][:username], params[:users][:password]
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
