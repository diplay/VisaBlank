class ClaimMailer < ActionMailer::Base
  default from: "from@visablank.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.claim_email.subject
  #
  def claim_email(claim, claim_url)
    @claim_url = claim_url
    mail to: claim.email
  end
end
