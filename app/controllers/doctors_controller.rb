class DoctorsController < ApplicationController
   before_action :find_doctor_id, only: [  :edit, :destroy, :update, :patients_history, :doctors_appointment_history ]
   before_action :authenticate_user!
   load_and_authorize_resource
  #
  def index
    @doctors = Doctor.all
  end

  #
  def show
    @doctor = Doctor.find(params[:id])
    if @doctor.nil?
      redirect_to action: :index
    end
  end

  #
  def new
    @doctor = Doctor.new
  end

  #
  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: "Your Profile is Successfully Created"
    else
      render :new
    end
  end

  #
  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: "Your profile was updated successfully"
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  #
  def edit
  end

  #
  def destroy
    if @doctor.destroy
      redirect_to "/", notice: "Your Account is Deleted permanently"
    else
      redirect_to doctors_path
    end
  end

  # doctords history with his patients
  def patients_history
    @history = User.joins(:appointments).where(appointments: { doctor_id: @doctor }).distinct
  end

  # determining doctors appointment
  def doctors_appointment_history
    @appointment_history = Appointment.joins(:user)
                           .where(doctor_id: @doctor.id)
                           .select("appointments.*, users.first_name, users.last_name, users.email, appointments.reason,appointments.status")
  end


private

  # finding doctors id
  def find_doctor_id
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :mobile_number, :address, :specialization, :consultation_fees, :experians)
  end
end
