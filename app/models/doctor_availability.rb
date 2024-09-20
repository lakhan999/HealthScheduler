class DoctorAvailability < ApplicationRecord
  belongs_to :doctor
  validates :date, :start_time, :end_time, presence: true
  validate :set_end_time

  # Scope to fetch future available dates if any
  scope :future, -> { where("date >= ?", Date.today) }

  # This method returns true if the doctor has availability on the given date
  def available?
    doctor.appointments.where(appointment_date: date).count < 3
  end

  private

  # this method basically prevent from the Time collaps and duplicacy
  def set_end_time
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
