class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
  end

  def search
    if params[:q].present?
      query = params[:q]

      # Search doctors and patients by name
      @doctors = Doctor.where("name ILIKE ?", "%#{query}%")
      @doctors = Doctor.where("specialization ILIKE ?", "%#{query}%")
      @doctors = Doctor.where("address ILIKE ?", "%#{query}%")
      @patients = User.where("first_name ILIKE ?", "%#{query}%")

    else
      @doctors = []
      @patients = []
    end
    # Render the results in your search view
    render :results
  end
end
