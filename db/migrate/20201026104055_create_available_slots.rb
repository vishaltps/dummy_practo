class CreateAvailableSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :available_slots do |t|
      t.references :doctor, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
