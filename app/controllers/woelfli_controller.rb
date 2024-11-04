class WoelfliController < ApplicationController
  def index
    @closest_woelfli_hock = Hock.closest_hock_by_stufe("Wölfli").first
  end
end
