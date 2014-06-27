class User < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  after_create :welcome_email

  has_secure_password

  def toggle_activation
    self.active = !active
    save
    #TODO don't forget to send mail
  end

  def change_password(_old_password, _password, _password_confirmation)
    #TODO don't forget to send email
    if try(:authenticate, _old_password)
      if update(password: _password,
                   password_confirmation: _password_confirmation)
        return :ok
      else
        return :fail_confirm
      end
    else
      return :fail_pass
    end
  end

  private
  def welcome_email
    pass = gen_password
    update(password: pass, password_confirmation: pass)
    UserMailer.new_user_email(self, pass).deliver
  end

  def gen_password
    rand(36**10).to_s(36)
  end

end
