class Listing < ActiveRecord::Base

	belongs_to :user
	has_many :reservations 

	mount_uploaders :photos, PhotosUploader

end
