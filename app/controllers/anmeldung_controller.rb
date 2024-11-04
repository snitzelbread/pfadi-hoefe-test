class AnmeldungController < ApplicationController
  def new
    @anmeldung = Anmeldung.new
  end

  def create
    @anmeldung = Anmeldung.new(anmeldung_params)

    if @anmeldung.save
      # Trigger the mailer after saving the form
      AnmeldungMailer.with(anmeldung: @anmeldung).anmeldung_email.deliver_now

      redirect_to @anmeldung, notice: "Anmeldung was successfully created, and email has been sent."
    else
      render :new, status: 422
    end

    @anmeldung.destroy
  end

  private

  def anmeldung_params
    params.require(:anmeldung).permit(
      :firstname, :lastname, :birthday, :email, :phone, :address,
      :place, :zipcode, :allergies, :stufe, :krankenkasse, :ahv_number,
      :rights_to_pictures, :message, :order_pfadikravatte
    )
  end
end
