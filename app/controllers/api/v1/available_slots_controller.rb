# frozen_string_literal: true

class Api::V1::AvailableSlotsController < ApplicationController
  before_action :fetch_resource

	def create
    available_slot = @resource.available_slots.create!(available_slot_params)
    render_success_response(available_slot, 'AvailableSlot created successfully')
	end

  def search
    booked_appointments = Appointment.select('appointments.available_slot_id').where(appointment_date: appointment_date, doctor_id: params[:doctor_id])
    available_slots = AvailableSlot.left_outer_joins(:appointments).where('available_slots.doctor_id = ? AND lower(day) = ? AND available_slots.id NOT IN (?)', params[:doctor_id], day, booked_appointments)
    render_success_response(available_slots)
  end

  private

	def available_slot_params
    params.require(:available_slot).permit(:start_time, :end_time, :day)
  end

  def fetch_resource
    @resource = Doctor.find(params[:doctor_id])
  end

  def appointment_date
    Date.parse(params[:appointment_date])
  end

  def day
    appointment_date&.strftime('%A')&.downcase
  end
end
