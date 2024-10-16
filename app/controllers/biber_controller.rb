class BiberController < ApplicationController
  def index
    @closest_biber_hock = Hock.closest_hock_by_stufe("Biber").first
  end
end
