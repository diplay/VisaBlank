#coding: utf-8
class ClaimMailer < ActionMailer::Base
  default from: "admin@officevisa.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.claim_email.subject
  #
  def claim_email(claim, claim_url)
    @claim_url = claim_url
    mail to: claim.email, subject: "Подана заявка"
  end

  def claim_accepted_email(claim, claim_url)
    @claim_url = claim_url
    mail to: claim.email, subject: "Заявка принята"
  end

  def claim_declined_email(claim, claim_url)
    @claim_url = claim_url
    mail to: claim.email, subject: "Заявка отклонена"
  end
end
