class ParentController < ApplicationController

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        session[:parent_id] = @parent.id
        format.html { redirect_to root_path, notice: "Parent was successfully created." }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new, status: 422 }
        flash[:alert] = @parent.errors.full_messages
      end
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:email, :password, :password_confirmation)
  end

  def set_parent
    @parent = Parent.find_by_id(params[session[:parent_id]])
  end

  def format_errors(object)
    error_messages = object.errors.full_messages.join(", ")
    "#{pluralize(object.errors.count, "Fehler")} verhinderten das Log-In: #{error_messages}"
  end
end
