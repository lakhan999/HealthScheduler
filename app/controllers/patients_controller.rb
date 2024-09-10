class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patient_id, only: [  :show, :edit, :update, :destroy, :appointment_history ]
  # before_action :set_index_page

  # Initialising all Patients
  def index
    @patient = Patient.first
  end

  # Defining new Patient
  def new
    @patient = Patient.new
  end

  # new patient creation
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: "Your Profile is created successfully"
    else
      render :new
    end
  end

  # method to show the details of the Patient
  def show
    if @patient.nil?
      redirect_to action: :index
    end
  end

  # Method to update the existing Patient
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Your profile was updated successfully"
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  # Method to Edit into the Patient
  def edit
  end

  # Patient Deletion
  def destroy
    if @patient.destroy
      redirect_to "/", notice: "Your Account is Deleted permanently"
    else
      redirect_to patients_path
    end
  end

  # method to find Patient id for beforaction callback
  def find_patient_id
    @patient = Patient.find(params[:id])
  end

  # Appointment history of the patient
  def appointment_history
    @history = @patient.appointments
    if @history == nil
      render_to @patient, notice: "You Dont Have any Appointment Yet"
    end
  end

  # def set_index_page
  #   if user_signed_in?
  #     render :new
  #   end
  # end
  # setting strong params for the patient
  private

  def patient_params
    params.require(:patient).permit(:name, :mobile_number, :address, :blood_group, :medical_history)
  end
end
