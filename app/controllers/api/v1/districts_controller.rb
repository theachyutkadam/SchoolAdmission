class Api::V1::DistrictsController < Api::V1::BaseController

  before_action :find_district, only: %i[edit update]
  before_action :build_district, only: %i[new create]

  def index
    @districts = District.all
    render json: @districts, :except => [:state_id, :created_at, :updated_at], :include => { :state => { :only => :name } }
  end

  def new; end

  def edit; end

  def create
    puts "--------------"
    puts "--------------"
    puts "--------------"
    puts "--------------"
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
    params.require(:district).permit(:name, :state_id)
  end
end
