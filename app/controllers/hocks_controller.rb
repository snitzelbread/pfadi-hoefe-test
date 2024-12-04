class HocksController < ApplicationController
  before_action :set_hock, only: %i[ edit update destroy ]
  before_action :require_login_leader
  include SelectHelper

  def index
    @biber_hocks = Hock.all_stufen_hocks("Biber")
    @woelfli_hocks = Hock.all_stufen_hocks("Wölfli")
    @pfadi_hocks = Hock.all_stufen_hocks("Pfadi")
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
    @hock.leader_id = current_leader.id

    if @hock.save
      redirect_to hocks_url, notice: "Hock was successfully created."
    else
      flash[:alert] = @hock.errors.full_messages
      render :new, status: 422
    end
  end

  # PATCH/PUT /hocks/1 or /hocks/1.json
  def update
    if @hock.update(hock_params)
      redirect_to hocks_url, notice: "Höck wurde erfolgreich aktualisiert."
    else
      render :edit, status: 422
    end
  end

  # DELETE /hocks/1 or /hocks/1.json
  def destroy
    @hock.destroy!

    flash[:notice] = "Höck wurde erfolgreich gelöscht"
    redirect_to hocks_url
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
