class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :doctor_availabilities
  validates :name, :mobile_number, :specialization, :consultation_fees, presence: true
  validates :mobile_number, numericality: true, length: { in: 0..10 }
end
