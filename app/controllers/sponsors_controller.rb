class SponsorsController < ApplicationController
  before_action :set_sponsor, only: %i[ edit update destroy ]
  before_action :require_login_leader, only: %i[ show_all edit destroy create new update ]

  # GET /sponsors or /sponsors.json
  def index
    @sponsors = Sponsor.all
  end

  def show_all
    @sponsors = Sponsor.all
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors or /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to sponsors_show_all_url, notice: "Sponsor was successfully created." }
        format.json { render :show_all, status: :created }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @sponsor.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /sponsors/1 or /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to sponsors_show_all_url, notice: "Sponsor was successfully updated." }
        format.json { render :show_all, status: :ok }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @sponsor.errors, status: 422 }
      end
    end
  end

  # DELETE /sponsors/1 or /sponsors/1.json
  def destroy
    @sponsor.destroy!

    respond_to do |format|
      format.html { redirect_to sponsors_show_all_url, status: :see_other, notice: "Sponsor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sponsor_params
      params.require(:sponsor).permit(:name, :linky, :image)
    end
end
