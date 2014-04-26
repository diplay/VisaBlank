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
    #TODO send email with password
  end

end
