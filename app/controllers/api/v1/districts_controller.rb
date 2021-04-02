class Api::V1::DistrictsController < Api::V1::BaseController

  before_action :find_district, only: %i[edit update]
  before_action :build_district, only: %i[new create]

  def index
    @districts = District.all
    render json: @districts
  end

  def new; end

  def edit; end

  def create
    @district = District.new(district_params)
    if @district.save
      redirect_to districts_path
      flash[:success] = 'District Successfully Created'
    else
      render :new
      flash[:notice] = 'District Not Create!'
    end
  end

  def update
    if @district.update_attributes(district_params)
      redirect_to districts_path
      flash[:success] = 'District Successfully Update'
    else
      render :edit
      flash[:notice] = 'District Not Update!'
    end
  end

  private

  def find_district
    @district = District.find(params[:id])
  end

  def build_district
    @district = District.new
  end

  def district_params
    params.require(:district).permit(:first_name, :middle_name, :last_name, :mother_name, :gender, :date_of_birth, :aadhaar_card_number, :standard_id, :classroom_id, :town, :is_handicap, :handicap_details, :is_active)
  end
end
