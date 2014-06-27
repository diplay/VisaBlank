#coding: utf-8
class UserMailer < ActionMailer::Base
  default from: "from@visablank.com"

  def new_user_email(user, password)
    @email = user.email
    @password = password
    mail to: user.email, subject: "Данные для входа"
  end

end
