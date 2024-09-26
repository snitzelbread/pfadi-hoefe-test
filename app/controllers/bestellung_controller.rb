class BestellungController < ApplicationController
  def new
    @bestellung = Bestellung.new
  end

  def create
    @bestellung = Bestellung.new(bestellung_params)

    if @bestellung.save
      # Trigger the mailer after saving the form
      BestellungMailer.with(bestellung: @bestellung).bestellung_email.deliver_now

      redirect_to @bestellung, notice: 'Bestellung was successfully created, and email has been sent.'
    else
      render :new, status: 422
    end

    @bestellung.destroy
  end


  private
  def bestellung_params
    params.require(:bestellung).permit(
      :firstname, :lastname, :email, :phone, :address,
      :city, :zipcode, :message, :order_list
    )
  end
end
