#coding: utf-8
class UserMailer < ActionMailer::Base
  default from: "admin@officevisa.ru"

  def new_user_email(user, password)
    @email = user.email
    @password = password
    mail to: user.email, subject: "Данные для входа"
  end

  def password_change_email(user, password)
    @email = user.email
    @password = password
    mail to: user.email, subject: "Изменение пароля"
  end

  def password_change_failed_email(user)
    mail to: user.email, subject: "Попытка изменения пароля"
  end

  def activation_changed_email(user)
    @status = user.active ? "активирован" : "блокирован"
    mail to: user.email, subject: "Ваш аккаунт #{@status}"
  end

end
