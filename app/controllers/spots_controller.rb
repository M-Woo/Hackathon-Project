class SpotsController < ApplicationController
  def index
  	@spots = Spot.all
  end

  def show
  	@spot = Spot.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def create
  	Spot.create(spot_params)
    redirect_to spots_path
  end

  def new
  	@spot = Spot.new
  end

  private 

  def spot_params
  	defaults = { user_id: current_user.id }
    params.require(:spot).permit(:user_id, :name, :address, :spot_type, :capacity, :price).reverse_merge(defaults)
  end
end
