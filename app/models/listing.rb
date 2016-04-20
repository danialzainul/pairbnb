class Listing < ActiveRecord::Base

	belongs_to :user
	has_many :reservations 

	mount_uploaders :photos, PhotosUploader

	searchkick

	def search_data
		{
			listing_name: listing_name,
			country: country,
			city: city,
		}
	end

end

Listing.reindex
