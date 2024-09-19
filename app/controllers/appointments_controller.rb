class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [  :show, :edit,  :update, :destroy  ]
  before_action :set_doctor, only: [  :new, :show, :update, :create, :edit ]
  before_action :set_available_dates, only: [ :create ]
  load_and_authorize_resource

  def index
    @appointments = Appointment.joins(:user).order("users.first_name ASC, users.last_name ASC")
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @appointment.appointment_date = params[:appointment_date] if params[:appointment_date].present?
    @available_slots = generate_time_slots("09:00", "17:00")

    if params[:appointment_date].present?
      booked_slots = @doctor.appointments.where(appointment_date: params[:appointment_date]).pluck(:appointment_time).map { |time| time.strftime("%H:%M") }
      @available_slots -= booked_slots
    end
  end

  def create
    @appointment = @doctor.appointments.build(appointment_params)
    @appointment.user = current_user

    # setting up logic for choosing only available dates for that perticular doctor
    @flage = false
    if @appointment.appointment_date.present?
      @available_dates.each do |available_date|
        if @appointment.appointment_date == available_date
          @appointment.save
          redirect_to @doctor, notice: "Appointment successfully booked."
          break
        else
          @flage = true
        end
      end
    end
    if @flage == true
      redirect_to doctor_doctor_availabilities_path, notice: "Please choose the correct available date."
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)

      # sending confirmation email to the user
      if @appointment.update(status: "Confirmed")
        UserMailer.appointment_confirmetion_email(@appointment).deliver_now
      end
      redirect_to @appointment, notice: "Appointment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to appointments_path, notice: "Appointment was successfully canceled."
    end
  end


  private

  # setting appointment for defferent actions
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # setting student for defferent actions
  def set_doctor
    if params[:doctor_id]
      @doctor = Doctor.find(params[:doctor_id])
    end
  end

  # setting available dates for create actions
  def set_available_dates
    @available_dates = @doctor.doctor_availabilities.future.select(&:available?).map(&:date)
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :reason, :appointment_time, :status)
  end

  # providing time slots to the user to choos appropreate time
  def generate_time_slots(start_time, end_time)
    start_time = Time.parse(start_time)
    end_time = Time.parse(end_time)
    time_slots = []

    while start_time < end_time
      time_slots << start_time.strftime("%H:%M")
      start_time += 30.minutes
    end
    time_slots
  end
end
