class User < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  after_create :welcome_email

  has_secure_password

  def toggle_activation
    self.active = !active
    save
    UserMailer.activation_changed_email(self).deliver
  end

  def change_password(_old_password, _password, _password_confirmation)
    if try(:authenticate, _old_password)
      if update(password: _password,
                   password_confirmation: _password_confirmation)
        UserMailer.password_change_email(self, _password).deliver
        return :ok
      else
        return :fail_confirm
      end
    else
      UserMailer.password_change_failed_email(self).deliver
      return :fail_pass
    end
  end

  private
  def welcome_email
    if try(:authenticate, "1234")
      pass = gen_password
      update(password: pass, password_confirmation: pass)
      UserMailer.new_user_email(self, pass).deliver
    end
  end

  def gen_password
    rand(36**10).to_s(36)
  end

end
