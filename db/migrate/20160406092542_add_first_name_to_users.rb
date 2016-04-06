class AddFirstNameToUsers < ActiveRecord::Migration
  def change
  	add_column :first_name, :string
  end
end
