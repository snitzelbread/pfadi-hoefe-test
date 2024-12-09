class CampsController < ApplicationController
  before_action :set_camp, only: %i[ edit update destroy ]
  before_action :require_login_leader, only: %i[ edit create update destroy ]
  before_action :set_request_referer, only: %i[ edit update destroy ]
  before_action :set_all_leaders, only: %i[ new edit create update ]
  # GET /camps or /camps.json
  def index
    @pfila = Camp.where("name = ?", "Pfingstlager").first if Camp.where("name = ?", "Pfingstlager").first.present?
    @sola = Camp.where("name = ?", "Sommerlager").first if Camp.where("name = ?", "Sommerlager").first.present?
    @wola = Camp.where("name = ?", "Wochenlager").first if Camp.where("name = ?", "Wochenlager").first.present?
  end


  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
  end

  # POST /camps or /camps.json
  def create
    @camp = Camp.new(camp_params)

    if @camp.save
      redirect_to camps_path, notice: "Lager wurde erfolgreich erstellt."
    else
      render :new, status: 422
    end
  end

  # PATCH/PUT /camps/1 or /camps/1.json
  def update
    if @camp.update(camp_params)
      redirect_to camps_path, notice: "Lager wurde erfolgreich aktualisiert."
    else
      render :edit, status: 422
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camp
    @camp = Camp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def camp_params
    params.require(:camp).permit(:name, :general_description, :template, :this_camp_description, :leader_id, :image)
  end

  def set_request_referer
    session[:return_to] = request.referer
  end

  def set_all_leaders
    @all_leaders = Leader.all
  end
end
