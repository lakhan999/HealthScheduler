class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :appointment_history ]

  def index
    @users = User.order("first_name ASC, last_name ASC")
  end

  def show
  end

  # User's appointment history
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
