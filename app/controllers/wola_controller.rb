class WolaController < ApplicationController
  def index
    @wola = Camp.where("name = ?", "Wölflilager").first
    @title_image = @wola.image if @wola.present? && @wola.image.attached?
  end
end
