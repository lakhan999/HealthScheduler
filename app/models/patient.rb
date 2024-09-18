class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  # has_many :doctors, through: :appointments
  belongs_to :user
  validates :name, :mobile_number, :blood_group, presence: true
  validates :mobile_number, numericality: { only_integer: true }, length: { in: 0..10 }
end
