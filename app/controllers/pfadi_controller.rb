class PfadiController < ApplicationController
  def index
    @closest_pfadi_hock = Hock.closest_hock_by_stufe("Pfadi").first
  end
end
