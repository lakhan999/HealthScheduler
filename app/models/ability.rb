# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Appointment, user_id: user.id
      can :create, Appointment
      can :read, Doctor
      can :read, DoctorAvailability
    end
  end
end
