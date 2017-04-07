class BookingsController < ApplicationController
 def index
  	@bookings = Booking.all
  end

  def create
  	Booking.create(booking_params)
  	puts 'params', booking_params.inspect
  	Spot.where(id: booking_params[:spot_id]).update_all(booked: 'true')
    redirect_to root_path
  end

  def show
  	@booking = Booking.find(params[:id])
  	@spots = Spot.all
  	@users = User.all
  end

  def edit
  end

  def new
  	# puts 'req', request.query_string.inspect
  	# puts 'params', params.inspect
  	@booking = Booking.new
  	@spot = Spot.find(params[:spot_id])
  end

  private 

  def booking_params
  	defaults = { user_id: current_user.id }
    params.require(:booking).permit(:user_id, :spot_id, :name, :duration, :address, :spot_type, :capacity, :price).reverse_merge(defaults)
  end
end
