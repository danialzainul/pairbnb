class ListingsController < ApplicationController

	# GET /demos/new
  def new
    @listing = Listing.new
  end

  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.all
    #should it be all, or should it be Listing.current_user
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to root_path, notice: "Listing created successfully :D"
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