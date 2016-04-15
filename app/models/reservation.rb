class Reservation < ActiveRecord::Base

	has_many :users, through: :payments
	belongs_to :listing
	has_many :payments

end
