class LeiterController < ApplicationController
  def new
    @leiter = Leiter.new
  end
  def create
    @leiter = Leiter.new(leiter_params)

    respond_to do |format|
      if @leiter.save
        session[:leiter_id] = @leiter.id
        format.html { redirect_to root_path, notice: "Leiter was successfully created." }
        format.json { render :show, status: :created, location: @leiter }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @leiter.errors, status: 422 }
      end
    end
  end

  private
  def leiter_params
    params.require(:leiter).permit(:pfadiname, :email, :password, :password_confirmation)
  end
end
