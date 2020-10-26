# frozen_string_literal: true

class Doctor < User
  has_many :available_slots
  has_many :appointments
  has_many :patients, through: :appointments
end