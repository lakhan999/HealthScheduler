class UserMailer < ApplicationMailer
  default from: "lparmar0705@gmail.com"

  def welcome_email
    @user = params[:user]
    @url  = "localhost:3000/login"
    mail(to: @user.email, subject: "Welcome to the HealthScheduler!")
  end

  # confirmation mail for appointment booking
  def appointment_regarding_email(appointment)
    @appointment = appointment
    @doctor = @appointment.doctor
    @user = @appointment.user
    @url  = "localhost:3000/login"
    mail(to: @user.email, subject: "Appointment Booking Regarding Mail!")
  end
end
