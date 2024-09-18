class PatientsController < ApplicationController
  before_action :authenticate_user!
  # Initialising all Patients  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [ :show, :appointment_history ]

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def appointment_history
    @history = @user.appointments
    if @history.empty?
      redirect_to patient_path(current_user), notice: "You don't have any appointments yet."
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
