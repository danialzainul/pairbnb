class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer	:reservation_id
    	t.integer	:user_id
    	t.string	:braintree_transaction_id
    	t.string	:last_4
      t.timestamps null: false
    end
    add_index :payments, [:reservation_id, :user_id], unique: true
  end
end
