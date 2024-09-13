class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :appointment_date, :appointment_time, :reason, presence: true
end
