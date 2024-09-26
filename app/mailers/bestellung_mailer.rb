class BestellungMailer < ActionMailer::Base
  default from: "julian.duss@outlook.com"
  layout "mailer"

  def bestellung_email
    @bestellung = params[:bestellung]  # Fetch the form data passed from the controller
    mail(
      to: "julian.duss@renuo.ch",            # Send to the form submitter's email address
      subject: "Your Registration Details"  # Customize subject line
    )
  end
end
