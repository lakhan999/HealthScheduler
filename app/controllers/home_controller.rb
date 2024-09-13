class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
  end
end
