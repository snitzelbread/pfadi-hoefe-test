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
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kleider.errors, status: :unprocessable_entity }
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
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kleider.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kleider
      @kleider = Kleider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kleider_params
      params.require(:kleider).permit(:name, :description, :image, :price, :size)
    end
end
