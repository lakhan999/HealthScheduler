class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patient_id, only: [ :show, :edit, :update, :destroy, :appointment_history ]


  # Initialising all Patients
  def index
    @patients = Patient.all
    # render json: @patients
  end

  # Defining new Patient
  def new
    @patient = Patient.new
  end

  # new patient creation
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: "The course was created successfully"
    else
      render :new
    end
  end

  # method to show the details of the Patient
  def show
    if @patient.nil?
      flash[:alert] = "Your Course was not found"
      redirect_to action: :index
    end
    #  inline helper will render/output the following content without any veiw for show action.
    #  render inline: "<p><%= @courses.course_name %></p><%=@courses.price%> <p></p>
  end

  # Method to update the existing Patient
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "The course was updated successfully"
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
      redirect_to courses_path, notice: "Course Deleted successfully"
    else
      redirect_to courses_path
    end
  end

  # method to find Patient id for beforaction callback
  def find_patient_id
    @patient = Patient.find(current_user.id)
  end

  # Appointment history of the patient
  def appointment_history
    @history = @patient.appointments
  end

  # setting strong params for the patient
  private

  def patient_params
    params.require(:patient).permit(:name, :mobile_number, :address, :blood_group, :medical_history)
  end
end
