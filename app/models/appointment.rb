class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :appointment_date, :appointment_time, :reason, presence: true
end
