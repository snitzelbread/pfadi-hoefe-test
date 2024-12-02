class BestellungController < ApplicationController
  def new
    @bestellung = Bestellung.new
  end

  def create
    @bestellung = Bestellung.new(bestellung_params)
    @bestellung.order_list = format_shopping_list(session[:shopping_list]) if session[:shopping_list].present?

    if @bestellung.save
      # Trigger the mailer after saving the form
      BestellungMailer.with(bestellung: @bestellung).bestellung_email.deliver_now

      flash[:notice] = "Bestellung wurde erfolgreich erstellt, und E-Mail wurde gesendet."
      redirect_to kleiders_path, status: 200
    else
      flash[:alert] = "Bestellung konnte nicht geschickt werden. Bitte versuche es erneut."
      render :new, status: :unprocessable_content
    end
    session[:shopping_list] = []
    @bestellung.destroy
  end

  def format_shopping_list(shopping_list)
    formatted_items = shopping_list.map do |item|
      amount = item["amount"].to_i # Convert amount to integer
      name = item["name"] # Name as string
      price = item["price"].to_f # Convert price to float
      total_price = (amount * price).round(2) # Calculate total price for the item

      "#{amount} x #{name} für je #{price} (Total: #{total_price})"
    end
    formatted_items.join("<br />").html_safe # Join items with line breaks and mark as safe HTML
  end

  private

  def bestellung_params
    params.require(:bestellung).permit(
      :first_name, :last_name, :email, :phone, :address,
      :city, :zipcode, :message, :order_list
    )
  end
end
