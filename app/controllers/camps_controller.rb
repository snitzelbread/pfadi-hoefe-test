class CampsController < ApplicationController
  before_action :set_camp, only: %i[ show edit update destroy ]

  # GET /camps or /camps.json
  def index
    @camps = Camp.all
  end

  # GET /camps/1 or /camps/1.json
  def show
  end

  # GET /camps/new
  def new
    @camp = Camp.new
    @all_leaders = Leader.all
  end

  # GET /camps/1/edit
  def edit
    @all_leaders = Leader.all
  end

  # POST /camps or /camps.json
  def create
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: "Camp was successfully created." }
        format.json { render :show, status: :created, location: @camp }
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
        format.html { redirect_to @camp, notice: "Camp was successfully updated." }
        format.json { render :show, status: :ok, location: @camp }
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
      params.require(:camp).permit(:name, :general_description, :quote, :template, :this_camp_description, :leader_id, images: [])
    end
end
