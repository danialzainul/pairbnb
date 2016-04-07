class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string	:user_id
    	t.string	:home_type
    	t.string	:room_type
    	t.text		:description
    	t.integer :accommodates
    	t.string	:country
    	t.string	:city
    	t.string	:address
    	t.integer	:price
    	t.date		:availability
    	t.integer :no_of_rooms
    	t.integer :no_of_beds
    	t.integer :no_of_bathrooms
    end
  end
end
