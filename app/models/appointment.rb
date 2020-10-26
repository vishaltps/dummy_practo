# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'User', foreign_key: :doctor_id
  belongs_to :patient, class_name: 'User', foreign_key: :patient_id
  belongs_to :available_slot

  validates_uniqueness_of :available_slot_id, scope: %i[doctor_id]

  after_create_commit :schedule_reminder_email

  def schedule_reminder_email
  	start_time = Time.at(available_slot.start_time).strftime(' %H:%M')
  	date = appointment_date.to_s
  	schedule_time = (Date.parse(date + start_time) - 30.minutes)
  	ReminderMailer.send_reminder(patient).deliver_later(wait_until: schedule_time)
  end
end
