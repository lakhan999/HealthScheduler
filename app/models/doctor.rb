class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctor_availabilities, dependent: :destroy
  validates :name, :mobile_number, :specialization, :consultation_fees, presence: true
  validates :mobile_number, numericality: true, length: { in: 0..10 }
end
