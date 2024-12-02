class CampsController < ApplicationController
  before_action :set_camp, only: %i[ edit update destroy ]
  before_action :require_login_leader, only: %i[ edit create update destroy ]

  # GET /camps or /camps.json
  def index
    @pfila = Camp.where("name = ?", "Pfingstlager")
    @sola = Camp.where("name = ?", "Sommerlager")
    @wola = Camp.where("name = ?", "Wochenlager")
  end


  # GET /camps/new
  def new
    @camp = Camp.new
    @all_leaders = Leader.all
  end

  # GET /camps/1/edit
  def edit
    @all_leaders = Leader.all
    session[:return_to] ||= request.referer
  end

  # POST /camps or /camps.json
  def create
    @all_leaders = Leader.all
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: "Camp was successfully created." }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @camp.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /camps/1 or /camps/1.json
  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to session.delete(:return_to), notice: "Camp was successfully updated." }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @camp.errors, status: 422 }
      end
    end
  end

  # DELETE /camps/1 or /camps/1.json
  def destroy
    @camp.destroy!

    respond_to do |format|
      format.html { redirect_to camps_path, status: :see_other, notice: "Camp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camp
    @camp = Camp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def camp_params
    params.require(:camp).permit(:name, :general_description, :template, :this_camp_description, :leader_id, images: [])
  end
end
