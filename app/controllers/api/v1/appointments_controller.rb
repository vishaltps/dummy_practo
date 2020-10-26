# frozen_string_literal: true

class Api::V1::AppointmentsController < ApplicationController
	def create
    appointment = Appointment.create!(appointment_params)
    render_success_response(appointment, 'Appointment created successfully')
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :available_slot_id, :appointment_date)
  end
end
