class AnmeldungMailer < ActionMailer::Base
  default from: "julian.duss@outlook.com"
  layout "mailer"

  def anmeldung_email
    @anmeldung = params[:anmeldung] # Fetch the form data passed from the controller
    mail(
      to: "julian.duss@renuo.ch", # Send to the form submitter's email address
      subject: "Vereinsanmeldung" # Customize subject line
    )
  end
end