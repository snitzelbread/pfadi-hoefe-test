class WolaController < ApplicationController
  def index
    @wola = Camp.where("name = ?", "Wochenlager").first
    @title_image = @wola.images.first if @wola.images.attached?
  end
end
