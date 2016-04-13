class Reservation < ActiveRecord::Base

	belongs_to :users
	belongs_to :listings

end
