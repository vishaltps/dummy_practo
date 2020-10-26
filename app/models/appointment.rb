# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'User', foreign_key: :doctor_id
  belongs_to :patient, class_name: 'User', foreign_key: :patient_id
  belongs_to :available_slot

  validates_uniqueness_of :available_slot_id, scope: %i[doctor_id]
end
