class ClaimMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.cite_letter.subject
  #
  def cite_letter(claim, user)
    @user = user
    @claim = claim

    mail to: "john.romas87@gmail.com", from: @user.email
  end
end