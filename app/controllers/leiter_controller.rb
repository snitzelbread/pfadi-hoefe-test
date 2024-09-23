class LeiterController < ApplicationController
  before_action :set_leiter, only: [ :edit, :update, :show ]
  before_action :require_login_leiter

  def new
    @leiter = Leiter.new
  end
  def create
    @leiter = Leiter.new(leiter_params)
    respond_to do |format|
      if @leiter.save
        session[:leiter_id] = @leiter.id
        format.html { redirect_to root_path }
        flash[:notice] = "Parent was successfully created."
        format.json { render :show, status: :created, location: @leiter }
      else
        format.html { render :new, status: 422 }
        flash[:alert] = format_errors(@leiter)
      end
    end
  end


  def update
    @leiter = current_leiter

    respond_to do |format|
      if @leiter.update(leiter_params)
        format.html { redirect_to profil_path(@leiter), notice: "Leiter was successfully updated." }
        format.json { render :show, status: :ok, location: @leiter }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @leiter.errors, status: 422 }
      end
    end
  end
  def show
    @leiter = Leiter.find_by_id(params[session[:leiter_id]])
    puts @leiter
  end

  private
  def leiter_params
    params.require(:leiter).permit(:pfadiname, :email, :password, :password_confirmation, :funktion, :stufe, :firstname, :lastname, :image)
  end
  def set_leiter
    @leiter = Leiter.find_by_id(params[session[:leiter_id]])
  end

  def format_errors(object)
    error_messages = object.errors.full_messages.join(", ")
    "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name} from being saved: #{error_messages}"
  end
end
