class ReminderMailer < ApplicationMailer
	def send_reminder(patient)
    @patient = patient
		mail(to: patient.email, subject: 'Welcome to My Awesome Site')
	end
end
