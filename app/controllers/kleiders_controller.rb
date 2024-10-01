class KleidersController < ApplicationController
  before_action :set_kleider, only: %i[ show edit update destroy ]


  # GET /kleiders or /kleiders.json
  def index
    @kleiders = Kleider.all
  end

  # GET /kleiders/1 or /kleiders/1.json
  def show
  end

  # GET /kleiders/new
  def new
    @kleider = Kleider.new

    # Initialize the shopping list if it doesn't exist

  end

  # GET /kleiders/1/edit
  def edit
  end

  # POST /kleiders or /kleiders.json
  def create
    @kleider = Kleider.new(kleider_params)

    respond_to do |format|
      if @kleider.save
        format.html { redirect_to kleider_url(@kleider), notice: "Kleider was successfully created." }
        format.json { render :show, status: :created, location: @kleider }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @kleider.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /kleiders/1 or /kleiders/1.json
  def update
    respond_to do |format|
      if @kleider.update(kleider_params)
        format.html { redirect_to kleider_url(@kleider), notice: "Kleider was successfully updated." }
        format.json { render :show, status: :ok, location: @kleider }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @kleider.errors, status: 422 }
      end
    end
  end

  # DELETE /kleiders/1 or /kleiders/1.json
  def destroy
    @kleider.destroy!

    respond_to do |format|
      format.html { redirect_to kleiders_url, notice: "Kleider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_to_list
    # Fetch the Kleider object by ID
    kleider = Kleider.find(params[:id])

    # Add the item to the session's shopping list array
    session[:shopping_list] << {
      name: kleider.name,
      price: kleider.price * params[:amount].to_i,
      description: kleider.description,
      amount: params[:amount] || 1, # Make sure 'amount' is present, defaulting to 1 if not
      added_at: Time.current
    }

    # Respond with Turbo or normal HTML
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("shopping_list", partial: "shopping_list") }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("shopping_list", partial: "shopping_list") }
      format.html { redirect_to kleiders_path}
    end
  end

  def clear_shopping_list
    session[:shopping_list] = [] # Clear the shopping list

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("shopping_list", partial: "shopping_list", locals: { shopping_list: session[:shopping_list] }) }
      format.html { redirect_to kleiders_path, notice: "Einkaufsliste wurde geleert." }
    end
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