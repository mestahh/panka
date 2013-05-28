class UserMailer < ActionMailer::Base
  default from: "panka@panka.herokuapp.com"
  
  def reset_password(email)
    mail(:to => email, :subject => "Password reset notification.")
  end
end
