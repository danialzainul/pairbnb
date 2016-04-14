class Reservation < ActiveRecord::Base

	has_many :users, through: :purchases
	belongs_to :listings
	has_many :purchases

end
