class Payment < ActiveRecord::Base

	belongs_to :reservation
	belongs_to :user, class_name: "User"
	
end
