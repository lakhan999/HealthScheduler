class DoctorAvailability < ApplicationRecord
  belongs_to :doctor
  validates :date, :start_time, :end_time, presence: true
  validate :end_time_is_after_start_time

  # Scope to fetch future available dates
  scope :future, -> { where("date >= ?", Date.today) }

  # This method returns true if the doctor has availability on the given date
  def available?
    doctor.appointments.where(appointment_date: date).count < 5
  end

  # def available_dates
  #   # Get future availability and filter out fully booked dates
  #   doctor_availabilities.future.select(&:available?).map(&:date)
  # end

  private

  # this method basically prevent from the Time collaps and duplicacy
  def end_time_is_after_start_time
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
