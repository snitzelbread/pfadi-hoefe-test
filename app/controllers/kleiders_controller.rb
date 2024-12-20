class KleidersController < ApplicationController
  before_action :set_kleider, only: %i[ show edit update destroy ]
  before_action :require_login_leader, only: %i[ edit create update destroy show ]

  def index
    @kleiders = Kleider.all
  end

  def show
  end

  def new
    @kleider = Kleider.new
  end

  # GET /kleiders/1/edit
  def edit
  end

  def create
    @kleider = Kleider.new(kleider_params)

    if @kleider.save
      flash[:notice] = "Kleidungsstück wurde erfolgreich erstellt!"
      redirect_to kleiders_path
    else
      flash[:alert] = "Kleidungsstück konnte nicht erstellt werden"
      render :new, status: :unprocessable_content
    end
  end

  def update
      if @kleider.update(kleider_params)
        flash[:notice] = "Kleidungsstück wurde erfolgreich aktualisiert!"
        redirect_to kleiders_path
      else
        flash[:alert] = @kleider.errors.full_messages
        render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @kleider.destroy!

    redirect_to kleiders_path, notice: "Kleidungsstück wurde gelöscht."
  end

  def add_to_list
    kleider = Kleider.find(params[:id])

    session[:shopping_list] << {
      name: kleider.name,
      price: kleider.price * params[:amount].to_i,
      amount: params[:amount] || 1
    }

    flash[:notice] = "#{kleider.name} added."
    redirect_to kleiders_path
  end

  def clear_shopping_list
    session[:shopping_list] = [] # Clear the shopping list

    flash[:notice] = "Einkaufsliste wurde geleert."
    format.html redirect_to bestellung_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kleider
    @kleider = Kleider.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kleider_params
    params.require(:kleider).permit(:name, :description, :image, :price, :size)
  end

  def format_errors(object)
    error_messages = object.errors.full_messages.join(", ")
    "#{object.errors.count} Fehler verhinderte(n) das Log-In: #{error_messages}"
  end
end
