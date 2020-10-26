# frozen_string_literal: true

class AvailableSlot < ApplicationRecord
  belongs_to :doctor
  has_many :appointments
end
