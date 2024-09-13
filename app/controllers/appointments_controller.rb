class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]
  before_action :set_doctor, only: [ :new, :create ]

  def index
    @appointments = current_user.appointments # For viewing user's own appointments
  end

  def show
    # Show the details of a specific appointment
  end

  def new
    @appointment = @doctor.appointments.build
  end

  def create
    @appointment = @doctor.appointments.build(appointment_params)
    @appointment.user = current_user

    if @appointment.save
      redirect_to @doctor, notice: "Appointment successfully booked."
    else
      render :new
    end
  end

  def edit
    # Allow the user or admin to edit the appointment details
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment was successfully canceled."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to @doctor, alert: "Appointment not found."
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to doctors_path, alert: "Doctor not found."
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :reason, :appointment_time, :status)
  end
end
