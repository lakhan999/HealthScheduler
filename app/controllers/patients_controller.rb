class PatientsController < ApplicationController
  before_action :authenticate_user!

  # Initialising all Patients  before_action :set_patient, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def appointment_history
    @history = current_user.appointments
    if @history.empty?
      redirect_to patient_path(current_user), notice: "You don't have any appointments yet."
    end
  end
end
