class ChangeAvailableSlots < ActiveRecord::Migration[6.0]
  def change
  	add_column :available_slots, :day, :string
  	remove_column :available_slots, :start_time, :datetime
  	add_column :available_slots, :start_time, :integer
  	remove_column :available_slots, :end_time, :datetime
  	add_column :available_slots, :end_time, :integer
  end
end
