class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Association for the user
  has_many :appointments, dependent: :destroy

  # defining roles with the help of enum
  enum role: { user: 1, admin: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :first_name, :last_name,  presence: true
  validates :mobile_number, numericality: true, length: { in: 0..10 }
end
