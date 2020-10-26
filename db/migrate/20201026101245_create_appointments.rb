class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :patient

      t.timestamps
    end
  end
end
