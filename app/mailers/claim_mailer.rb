class ClaimMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.cite_letter.subject
  #
  def cite_letter(claim, user, message)
    @user = user
    @claim = claim
    @recipient = @claim.adjustor.email
    @message = message
    filename = "claim_#{@claim.number}.pdf"
    attachments[filename] = CiteLetterPdf.new(@claim).render

    mail to: "john.romas87@gmail.com", from: "#{@user.full_name} <#{@user.email}>", bcc: @user.email, subject: "#{@claim.claimant.full_name} - Cite Letter - #{@claim.number}"
  end
end
