class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:listing_id])
	end

	def index
		@reservations = Reservation.all
	end

	def show
		# @listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		# @reservation.user_id = current_user.id
		if @reservation.save
      redirect_to root_path notice: "Reservation created successfully :D"
    else
      render :new
    end
  end 

  private

  #strong_params is like a white list for permitted parameters, u dont allow anything not permitted to be saved and throw u error
  def reservation_params # This is white listing the strong params
    params.require(:reservation).permit(:start_date, :end_date, :listing_id)
  end

end