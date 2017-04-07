class BookingsController < ApplicationController
 def index
  	@bookings = Booking.all
  end

  def create
  	Booking.create(booking_params)
  	puts 'params', booking_params.inspect
  	Spot.where(id: booking_params[:spot_id]).update_all(booked: 'true')
    redirect_to "https://www.google.com/maps/dir/924+26th+Ave+S,+Seattle,+WA/General+Assembly+Seattle,+Seattle+Tower+Third+Floor,+1218+3rd+Ave,+Seattle,+WA+98101/@47.5998563,-122.3523554,13z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x54906aedb626e463:0xc675461e62d4a539!2m2!1d-122.298848!2d47.593842!1m5!1m1!1s0x549015311e076f9b:0x72502e729ee873de!2m2!1d-122.335473!2d47.6077381"
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
