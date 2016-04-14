class Listing < ActiveRecord::Base

	belongs_to :users
	has_many :reservations 

	mount_uploaders :photos, PhotosUploader

end
