class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:listing_id])
	end

	def index
		@reservations = Reservation.all
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@listing = Listing.find(params[:listing_id])
		@reservation.total_price = @listing.price * ((@reservation.end_date - @reservation.start_date).to_i)
		if @reservation.save
      redirect_to listing_path(params[:listing_id]), notice: "Reservation created successfully :D"
    else
      redirect_to root_path
    end
  end 

  def edit
    @reservation = Reservation.find(params[:id])
    @listing = @reservation.listing
  end

  def update
    @reservation = Reservation.find(params[:id])
    @listing = @reservation.listing
    @reservation.update(reservation_params)
    @reservation.total_price = @listing.price * ((@reservation.end_date - @reservation.start_date).to_i)
    if @reservation.save
      redirect_to [@listing, @reservation], notice: "Reservation updated successfully! :D "
    else
      render :update
    end 
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to listing_path(params[:listing_id])
  end

  private

  #strong_params is like a white list for permitted parameters, u dont allow anything not permitted to be saved and throw u error
  def reservation_params # This is white listing the strong params
    params.require(:reservation).permit(:start_date, :end_date, :listing_id)
  end

end