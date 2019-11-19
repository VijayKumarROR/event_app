class AddColumnsToAddresses < ActiveRecord::Migration[5.0]
  def change
  	add_column :addresses, :user_id, :integer
  	add_column :addresses, :event_id, :integer
  end
end
