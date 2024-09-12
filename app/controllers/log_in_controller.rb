class LogInController < ApplicationController
  def new
    @leiter = Leiter.new
  end

  def create
    def create
      @leiter = Leiter.find_by(pfadiname: params[:leiter][:pfadiname])

      respond_to do |format|
        if @leiter.present? && @leiter.authenticate(params[:leiter][:password])
          session[:leiter_id] = @leiter.id
          format.html { redirect_to root_path, notice: "You were logged in successfully!" }
        else
          @leiter ||= Leiter.new
          @leiter.errors.add(:base, "Invalid Pfadiname or password")

          format.html { render :new, status: 422 }
        end
      end
    end
  end

  def destroy
    puts "Session before reset: #{session[:leiter_id]}"
    reset_session
    redirect_to login_path, notice: "You have been logged out."
  end
end
