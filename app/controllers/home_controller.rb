class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
  end

  # searching via name and other attributes of the user
  def search
    if params[:q].present?
      query = params[:q]
      @doctors = Doctor.where("name ILIKE ? OR address ILIKE ? OR specialization ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
      @patients = User.where("first_name ILIKE ?", "%#{query}%")
    else
      @doctors = []
      @patients = []
    end
    render :results
  end
end
