class ListingsController < ApplicationController

	# GET /demos/new
  def new
    @listing = Listing.new
  end
  
  def show
    @listing = Listing.all
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  private

  def listing_params # This is white listing the strong params
    params.require(:listing).permit(:listing_name, :property_type, :room_type, :description, :accommodates, :country, :city, :address, :price, :currency, :availability, :bedrooms, :beds, :bathrooms)
  end


#strong_params is like a white list for permitted parameters, u dont allow anything not permitted to be saved and throw u error
end