class AddressesController < ApplicationController
  before_action :find_address, only: %i[edit update]
  before_action :build_address, only: %i[new create]

  def index;end

  def new
    @user = User.find(params[:user])
    @addresses = Address.all
  end

  def edit
    user = @address.user.id
    @user = User.find(user)
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to new_address_path(user: @address.user_id)
      flash[:success] = "Address Create Successfully"
    else
      render :new
      flash[:notice] = "Address Not Create!"
    end
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to new_address_path(user: @address.user_id)
      flash[:success] = "Address Update Successfully"
    else
      render :edit
      flash[:notice] = "Address Not Update!"
    end
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def build_address
    @address = Address.new
  end

  def address_params
    params.require(:address).permit(:country_id, :state_id, :district_id, :taluka_id, :pincode, :user_id)
  end

end
