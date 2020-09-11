class AddressesController < ApplicationController
  before_action :find_address, only: %i[edit update]
  before_action :build_address, only: %i[new, create]

  def index;end

  def new
    if params.include?("student")
      @addressable = Student.find(params[:student].to_i)
    else
      @addressable = Teacher.find(params[:teacher].to_i)
    end
    @address = Address.new
    @addresses = Address.all
  end

  def edit;end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
      flash[:success] = "Address Create Successfully"
    else
      render :new
      flash[:notice] = "Address Not Create!"
    end
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to addresses_path
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
    params.require(:address).permit(:country_id, :state_id, :district_id, :taluka_id, :pincode, :addressable_id, :addressable_type)
  end


end
