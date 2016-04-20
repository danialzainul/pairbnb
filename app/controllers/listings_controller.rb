class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def index
    if params[:search].nil?
      @listings = Listing.all
    else
      @listings = Listing.search params[:search]
    end
    
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.where(listing_id: params[:id]) # where and find_by => .where(listing_id: params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    return @error_msg = "Maximum 5 photos" if @listing.photos.length > 5
    respond_to do |format|
      if @listing.save
        format.html { redirect_to listings_path, notice: "Listing created successfully :D" }
      else
        render :new
      end
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