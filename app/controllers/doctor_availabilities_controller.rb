class DoctorAvailabilitiesController < ApplicationController
    before_action :set_doctor_id, only: [ :new, :create, :destroy, :show, :index, :edit, :update ]
    before_action :set_availability, only: [ :destroy, :update, :show, :edit ]

    # load_and_authorize_resource
    def index
      @available_dates = @doctor.doctor_availabilities.future.select(&:available?).map(&:date)
      @available_dates_for_picker = @available_dates.map { |d| d.strftime("%Y-%m-%d") }
    end

    def new
      @availability = DoctorAvailability.new
    end

    def edit
    @availabilities = @doctor.doctor_availabilities
    end

    def show
      @available_dates = @doctor.doctor_availabilities.pluck(:date).uniq
      @available_dates_for_picker = @available_dates.map { |date| date.strftime("%Y-%m-%d") }
    end

    def  create
      @availability = @doctor.doctor_availabilities.new(availability_params)
      if @availability.save
        redirect_to doctors_path, notice: "Availability was successfully created."
      else
        render :new, alert: "There was an error creating the availability."
      end
    end

    def update
      if @availability.update(availability_params)
        redirect_to @doctor, notice: "Availability updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @availability.destroy
        redirect_to @doctor, notice: "Availability deleted successfully."
      else
        redirect_to doctors_path, alert: "Error deleting availability."
      end
    end

    private

    def availability_params
      params.require(:doctor_availability).permit(:date, :start_time, :end_time)
    end

    def set_doctor_id
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_availability
      @availability = DoctorAvailability.find(params[:id])
    end
end
