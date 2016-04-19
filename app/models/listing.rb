require 'elasticsearch/model'

class Listing < ActiveRecord::Base

	belongs_to :user
	has_many :reservations 

	mount_uploaders :photos, PhotosUploader

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end

Listing.import # for auto sync model with elastic search