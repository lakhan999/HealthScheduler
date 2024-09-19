class UserMailer < ApplicationMailer
  default from: "healthscheduler@gmail.com"

  def welcome_email
    @user = params[:user]
    @url  = "http://example.com/login"
    mail(to: @user.email, subject: "Welcome to the HealthScheduler!")
  end

  # confirmation mail for appointment booking
  def appointment_confirmetion_email(appointment)
    @appointment = appointment
    @doctor = @appointment.doctor
    @user = @appointment.user
    @url  = "http://example.com/login"
    mail(to: @user.email, subject: "Appointment Booking Confirmation Mail!")
  end
end
