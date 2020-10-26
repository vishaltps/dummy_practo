class AddAppointmentDateToAppointment < ActiveRecord::Migration[6.0]
  def change
  	add_column :appointments, :appointment_date, :date
  end
end
