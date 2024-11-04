class HocksController < ApplicationController
  before_action :set_hock, only: %i[ edit update destroy ]
  before_action :require_login_leader

  # GET /hocks or /hocks.json
  def index
    @biber_hocks = Hock.all_stufen_hocks("Biber")
    @woelfli_hocks = Hock.all_stufen_hocks("Wölfli")
    @pfadi_hocks = Hock.all_stufen_hocks("Pfadi")

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /hocks/new
  def new
    @hock = Hock.new
  end

  # GET /hocks/1/edit
  def edit
  end

  # POST /hocks or /hocks.json
  def create
    @hock = Hock.new(hock_params)

    respond_to do |format|
      if @hock.save
        format.html { redirect_to hocks_url, notice: "Hock was successfully created." }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @hock.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /hocks/1 or /hocks/1.json
  def update
    respond_to do |format|
      if @hock.update(hock_params)
        format.html { redirect_to hocks_url, notice: "Hock was successfully updated." }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @hock.errors, status: 422 }
      end
    end
  end

  # DELETE /hocks/1 or /hocks/1.json
  def destroy
    @hock.destroy!

    respond_to do |format|
      format.html { redirect_to hocks_url, notice: "Hock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hock
    @hock = Hock.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hock_params
    params.require(:hock).permit(:title, :description, :datetime, :stufe, :leader_id, :ort)
  end

  def format_errors(object)
    error_messages = object.errors.full_messages.join(", ")
    "#{object.errors.count} Fehler verhinderte(n) das speichern des Höcks: #{error_messages}"
  end
end
