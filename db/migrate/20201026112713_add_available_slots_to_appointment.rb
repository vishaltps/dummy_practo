class AddAvailableSlotsToAppointment < ActiveRecord::Migration[6.0]
  def change
  	add_reference :appointments, :available_slot, foreign_key: true
  end
end
