class ListingsController < ApplicationController

	# GET /demos/new
  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.where(params[:id])
  end

  def create
    # @listing = current_user.listings.new(listing_params)
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to listings_path, notice: "Listing created successfully :D"
    else
      render :new
    end 
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    if @listing.save
      redirect_to listing_path, notice: "Listing updated successfully! :D "
    else
      render :update
    end 
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private

  #strong_params is like a white list for permitted parameters, u dont allow anything not permitted to be saved and throw u error
  def listing_params # This is white listing the strong params
    params.require(:listing).permit(:listing_name, :property_type, :room_type, :description, :accommodates, :country, :city, :address, :price, :currency, :availability, :bedrooms, :beds, :bathrooms, {photos: []})
  end

end