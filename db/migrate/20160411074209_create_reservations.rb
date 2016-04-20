class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string	:user_id
    	t.string	:listing_id
    	t.integer :total_price
    	t.integer	:guest
    	t.date 		:start_date
    	t.date 		:end_date
      t.timestamps null: false
    end
  end
end
