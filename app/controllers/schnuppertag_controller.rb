class SchnuppertagController < ApplicationController
  def index
    @anmeldung = Anmeldung.new
  end
end
