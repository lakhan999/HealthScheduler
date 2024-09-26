class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :appointment_history ]
  # load_and_authorize_resource
  def index
      @users = User.page(params[:page]).per(10).order("first_name ASC, last_name ASC")
  end

  def show
  end

  # User's appointment history
  def appointment_history
    @history = @user.appointments.order("appointment_date")
    if @history.empty?
      redirect_to patient_path(current_user), notice: "You don't have any appointments yet."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
