class LogInController < ApplicationController
  def new
    @leader = Leader.new
    @parent = Parent.new
  end

  def create; end

  def destroy
    reset_session
    redirect_to login_path, notice: "Du wurdest ausgeloggt!"
  end

  private

  def format_errors(object)
    error_messages = object.errors.full_messages.join(", ")
    "#{object.errors.count} Fehler verhinderte(n) das Log-In: #{error_messages}"
  end
end

