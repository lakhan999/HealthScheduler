class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.last).welcome_email
  end
  # def appointment_confirmetion_email
  #   UserMailer.with(user: User.last).appointment_confirmetion_email
  # end
end
