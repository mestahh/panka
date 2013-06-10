class UserMailer < ActionMailer::Base
  default from: "panka@panka.herokuapp.com"
  
  def reset_password(user)
    @user = user
    mail(:to => user.email, :subject => "Password reset notification.")
  end
end
