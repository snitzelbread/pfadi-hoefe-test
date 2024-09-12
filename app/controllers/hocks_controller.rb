class HocksController < ApplicationController
  before_action :set_hock, only: %i[ show edit update destroy ]

  # GET /hocks or /hocks.json
  def index
    @hocks = Hock.all
  end

  # GET /hocks/1 or /hocks/1.json
  def show
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
        format.html { redirect_to hock_url(@hock), notice: "Hock was successfully created." }
        format.json { render :show, status: :created, location: @hock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hocks/1 or /hocks/1.json
  def update
    respond_to do |format|
      if @hock.update(hock_params)
        format.html { redirect_to hock_url(@hock), notice: "Hock was successfully updated." }
        format.json { render :show, status: :ok, location: @hock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hock.errors, status: :unprocessable_entity }
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
      params.require(:hock).permit(:title, :description)
    end
end
