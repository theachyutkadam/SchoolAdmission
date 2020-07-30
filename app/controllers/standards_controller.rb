class StandardsController < ApplicationController
  before_action :find_standard, only: [:edit, :update]
  before_action :build_standard, only: [:new, :create]

  def index
    @standards = Standard.all
  end

  def new;end

  def edit;end

  def create
    @standard = Standard.new(standard_params)
    if @standard.save
      redirect_to standards_path
    else
      render :new
    end
  end

  def update
    if @standard.update_attributes(standard_params)
      redirect_to standards_path
    else
      render :edit
    end
  end

  private

  def find_standard
    @standard = Standard.find(params[:id])
  end

  def build_standard
    @standard = Standard.new
  end

  def standard_params
    params.require(:standard).permit(:name, :classroom_id)
  end
end
