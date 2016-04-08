class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string	:user_id
        t.string    :listing_name
    	t.string	:property_type
    	t.string	:room_type
    	t.text		:description
    	t.integer	:accommodates
    	t.string	:country
    	t.string	:city
    	t.string	:address
    	t.integer	:price
        t.string    :currency
    	t.date		:availability
    	t.integer   :bedrooms
    	t.integer   :beds
    	t.integer   :bathrooms
      t.timestamps null: false
    end
  end
end