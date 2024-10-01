class LogInController < ApplicationController
  def new
    @leader = Leader.new
    @parent = Parent.new
  end

def create

  unless params[:parent].nil?
    @parent = Parent.find_by(email: params[:parent][:email])
    respond_to do |format|
      if @parent.present? && @parent.authenticate(params[:parent][:password])
        session[:parent_id] = @parent.id
        format.html { redirect_to root_path, notice: "Erfolgreich eingeloggt!" }
      else
        @parent ||= Parent.new
        @parent.errors.add(:base, "E-Mail oder Passwort ist falsch.")
        format.html { render "log_in/new", status: 422 }
      end
    end
  end
end

  def destroy
    reset_session
    redirect_to login_path, notice: "Du wurdest ausgeloggt!"
  end
end

private

def format_errors(object)
  error_messages = object.errors.full_messages.join(", ")
  "#{object.errors.count} Fehler verhinderte(n) das Log-In: #{error_messages}"
end